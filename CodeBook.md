## The Code Book

The data and variables and how they were transformed are described here.

### Final Tidy dataset from the merged dataset

The merged dataset contains multiple observations for the mean of the variables for each subject and activity. To obtain a tidy dataset for the final submission, for each variables, the average of the mean values were calculated using melt and dcast of the reshape2 package and a final tidy dataset was obtained containing 180 rows (30 subjects * 6 activities) and 68 rows (subject, activity and 66 variables).

### Tidy dataset Variables

Each variables are present in a separate column. The "final_avg_tidy_dataset.txt" contains the final tidy data to be considered here.

Below are each of the variables contained in the tidy dataset:

| **Variable Name** | **Variable Description**                               |
| -----------------:| :------------------------------------------------------|
| subject_id        | Identifies the subject which performed the task. Contains one of the numbers between 1 to 30.           |
| activity_name     | Identifies the activity the subject performs. Can have one of the following values: <ol><li>LAYING</li><li>SITTING</li><li>STANDING</li> <li>WALKING</li><li>WALKING_UPSTAIRS</li><li>WALKING_DOWNSTAIRS</li> |
| avg_mean_time_body_acceleration_xaxis | Average of mean values of the body linear acceleration on X axis for the time domain. |
| avg_mean_time_body_acceleration_yaxis | Average of mean values of the body linear acceleration on Y axis for the time domain. |
| avg_mean_time_body_acceleration_zaxis | Average of mean values of the body linear acceleration on Z axis for the time domain. |
| std_mean_time_body_acceleration_xaxis | Average of standard deviation values of the body linear acceleration on X axis for the time domain. |
| std_mean_time_body_acceleration_yaxis | Average of standard deviation values of the body linear acceleration on Y axis for the time domain. |
| std_mean_time_body_acceleration_zaxis | Average of standard deviation values of the body linear acceleration on Z axis for the time domain. |
| avg_mean_time_gravity_acceleration_xaxis | Average of mean values of the gravity linear acceleration on X axis for the time domain. |
| avg_mean_time_gravity_acceleration_yaxis | Average of mean values of the gravity linear acceleration on Y axis for the time domain. |
| avg_mean_time_gravity_acceleration_zaxis | Average of mean values of the gravity linear acceleration on Z axis for the time domain. |
| avg_std_time_gravity_acceleration_xaxis | Average of standard deviation values of the gravity linear acceleration on X axis for the time domain. |
| avg_std_time_gravity_acceleration_yaxis | Average of standard deviation values of the gravity linear acceleration on Y axis for the time domain. |
| avg_std_time_gravity_acceleration_zaxis | Average of standard deviation values of the gravity linear acceleration on Z axis for the time domain. |
| avg_mean_time_body_acceleration_jerk_xaxis | Average of mean values of the jerk signal of body linear acceleration on X axis for the time domain. |
| avg_mean_time_body_acceleration_jerk_yaxis | Average of mean values of the jerk signal of body linear acceleration on Y axis for the time domain. |
| avg_mean_time_body_acceleration_jerk_zaxis | Average of mean values of the jerk signal of body linear acceleration on Z axis for the time domain. |
| avg_std_time_body_acceleration_jerk_xaxis | Average of standard deviation values of the jerk signal of body linear acceleration on X axis for the time domain. |
| avg_std_time_body_acceleration_jerk_yaxis | Average of standard deviation values of the jerk signal of body linear acceleration on Y axis for the time domain. |
| avg_std_time_body_acceleration_jerk_zaxis | Average of standard deviation values of the jerk signal of body linear acceleration on Z axis for the time domain. |
| avg_mean_time_body_angular_velocity_xaxis | Average of mean values of the body angular velocity on X axis for the time domain. |
| avg_mean_time_body_angular_velocity_yaxis | Average of mean values of the body angular velocity on Y axis for the time domain. |
| avg_mean_time_body_angular_velocity_zaxis | Average of mean values of the body angular velocity on Z axis for the time domain. |
| avg_std_time_body_angular_velocity_xaxis | Average of standard deviation values of the body angular velocity on X axis for the time domain. |
| avg_std_time_body_angular_velocity_yaxis | Average of standard deviation values of the body angular velocity on Y axis for the time domain. |
| avg_std_time_body_angular_velocity_zaxis | Average of standard deviation values of the body angular velocity on Z axis for the time domain. |
| avg_mean_time_body_angular_velocity_jerk_xaxis | Average of mean values of the jerk signal of body angular velocity on X axis for the time domain. |
| avg_mean_time_body_angular_velocity_jerk_yaxis | Average of mean values of the jerk signal of body angular velocity on Y axis for the time domain. |
| avg_mean_time_body_angular_velocity_jerk_zaxis | Average of mean values of the jerk signal of body angular velocity on Z axis for the time domain. |
| avg_std_time_body_angular_velocity_jerk_xaxis | Average of standard deviation values of the jerk signal of body angular velocity on X axis for the time domain. |
| avg_std_time_body_angular_velocity_jerk_yaxis | Average of standard deviation values of the jerk signal of body angular velocity on Y axis for the time domain. |
| avg_std_time_body_angular_velocity_jerk_zaxis | Average of standard deviation values of the jerk signal of body angular velocity on Z axis for the time domain. |
| avg_mean_time_body_acceleration_magnitude | Average of mean of the magnitude for the body linear acceleration for the time domain. |
| avg_std_time_body_acceleration_magnitude | Average of standard deviation of the magnitude for the body linear acceleration for the time domain. |
| avg_mean_time_gravity_acceleration_magnitude | Average of mean of the magnitude for the gravity linear acceleration for the time domain. |
| avg_std_time_gravity_acceleration_magnitude | Average of standard deviation of the magnitude for the gravity linear acceleration for the time domain. |
| avg_mean_time_body_acceleration_jerk_magnitude | Average of mean of the magnitude of the jerk signal for the body linear acceleration for the time domain. |
| avg_std_time_body_acceleration_jerk_magnitude | Average of standard deviation of the magnitude of the jerk signal for the body linear acceleration for the time domain. |
| avg_mean_time_body_angular_velocity_magnitude | Average of mean of the magnitude for the gravity angular velocity for the time domain. |
| avg_std_time_body_angular_velocity_magnitude | Average of standard deviation of the magnitude for the gravity angular velocity for the time domain. |
| avg_mean_time_body_angular_velocity_jerk_magnitude | Average of mean of the magnitude of the jerk signal for the body angular velocity for the time domain. |
| avg_std_time_body_angular_velocity_jerk_magnitude | Average of standard deviation of the magnitude of the jerk signal for the body angular velocity for the time domain. |
| avg_mean_frequency_body_acceleration_xaxis | Average of mean values of the body linear acceleration on X axis for the frequency domain. |
| avg_mean_frequency_body_acceleration_yaxis | Average of mean values of the body linear acceleration on Y axis for the frequency domain. |
| avg_mean_frequency_body_acceleration_zaxis | Average of mean values of the body linear acceleration on Z axis for the frequency domain. |
| avg_std_frequency_body_acceleration_xaxis | Average of standard deviation values of the body linear acceleration on X axis for the frequency domain. |
| avg_std_frequency_body_acceleration_yaxis | Average of standard deviation values of the body linear acceleration on Y axis for the frequency domain. |
| avg_std_frequency_body_acceleration_zaxis | Average of standard deviation values of the body linear acceleration on Z axis for the frequency domain. |
| avg_mean_frequency_body_acceleration_jerk_xaxis | Average of mean values of the jerk signal for the body linear acceleration on X axis for the frequency domain. |
| avg_mean_frequency_body_acceleration_jerk_yaxis | Average of mean values of the jerk signal for the body linear acceleration on Y axis for the frequency domain. |
| avg_mean_frequency_body_acceleration_jerk_zaxis | Average of mean values of the jerk signal for the body linear acceleration on Z axis for the frequency domain. |
| avg_std_frequency_body_acceleration_jerk_xaxis | Average of standard deviation values of the jerk signal for the body linear acceleration on X axis for the frequency domain. |
| avg_std_frequency_body_acceleration_jerk_yaxis | Average of standard deviation values of the jerk signal for the body linear acceleration on Y axis for the frequency domain. |
| avg_std_frequency_body_acceleration_jerk_zaxis | Average of standard deviation values of the jerk signal for the body linear acceleration on Z axis for the frequency domain. |
| avg_mean_frequency_body_angular_velocity_xaxis | Average of mean values of the body angular velocity on X axis for the frequency domain. |
| avg_mean_frequency_body_angular_velocity_yaxis | Average of mean values of the body angular velocity on Y axis for the frequency domain. |
| avg_mean_frequency_body_angular_velocity_zaxis | Average of mean values of the body angular velocity on Z axis for the frequency domain. |
| avg_std_frequency_body_angular_velocity_xaxis | Average of standard deviation values of the body angular velocity on X axis for the frequency domain. |
| avg_std_frequency_body_angular_velocity_yaxis | Average of standard deviation values of the body angular velocity on Y axis for the frequency domain. |
| avg_std_frequency_body_angular_velocity_zaxis | Average of standard deviation values of the body angular velocity on Z axis for the frequency domain. |
| avg_mean_frequency_body_acceleration_magnitude | Average of mean of the magnitude for the body linear acceleration for the frequency domain. |
| avg_std_frequency_body_acceleration_magnitude | Average of standard deviation of the magnitude for the body linear acceleration for the frequency domain. |
| avg_mean_frequency_body_acceleration_jerk_magnitude | Average of mean of the magnitude of the jerk signal for the body linear acceleration for the frequency domain. |
| avg_std_frequency_body_acceleration_jerk_magnitude | Average of standard deviation of the magnitude of the jerk signal for the body linear acceleration for the frequency domain. |
| avg_mean_frequency_body_angular_velocity_magnitude | Average of mean of the magnitude for the body angular velocity for the frequency domain. |
| avg_std_frequency_body_angular_velocity_magnitude | Average of standard deviation of the magnitude for the body angular velocity for the frequency domain. |
| avg_mean_frequency_body_angular_velocity_jerk_magnitude | Average of mean of the magnitude of the jerk signal for the body angular velocity for the frequency domain. |
| avg_std_frequency_body_angular_velocity_jerk_magnitude | Average of standard deviation of the magnitude of the jerk signal for the body angular velocity for the frequency domain. |


