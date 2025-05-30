function results = compute_dprime_heartbeat(data)
% compute_dprime_heartbeat - Computes an empirical d-prime for heartbeat detection.
%
% INPUT:
%   data - Struct array with fields:
%       - id: subject identifier
%       - heartbeats: vector of heartbeat times
%       - responses: vector of response times
%
% OUTPUT:
%   results - Table with d-prime and components for each subject

nSubjects = length(data);
results = table();

for s = 1:nSubjects
    subj = data(s);
    hb = subj.heartbeats(:);
    resp = subj.responses(:);
    hbamount = length(hb);
    
    hits = 0;
    misses = 0;
    false_alarms = 0;
    correct_rejections = 0;

    for i = 1:length(hb)-1
        hb_start = hb(i);
        hb_end = hb(i+1);

        responses_in_interval = resp(resp > hb_start & resp <= hb_end);
        n_resp = length(responses_in_interval);

        if n_resp == 0
            misses = misses + 1;
        elseif n_resp == 1
            hits = hits + 1;
            correct_rejections = correct_rejections + 1;
        else
            hits = hits + 1;
            false_alarms = false_alarms + (n_resp - 1);
        end
    end

    results.id{s} = subj.id;
    results.heartbeats(s,1) = hbamount;
    results.hits(s,1) = hits;
    results.misses(s,1) = misses;
    results.false_alarms(s,1) = false_alarms;
    results.correct_rejections(s,1) = correct_rejections;
end

% Number of signal trials and noise trials
signal_trials = results.hits + results.misses;
noise_trials = results.false_alarms + results.correct_rejections;

% Apply 0.5 correction
hit_rates = (results.hits + 0.5) ./ (signal_trials + 1);
fa_rates = (results.false_alarms + 0.5) ./ (noise_trials + 1);

z_hitr = zscore_pooled(hit_rates);
z_far = zscore_pooled(fa_rates);

results.d_prime = z_hitr - z_far;
end
