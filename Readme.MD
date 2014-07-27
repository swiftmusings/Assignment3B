###Readme.md

Fist I build my dataframes across, starting with the train data, then add the test data to the bottom of a new dataframe

I then import column names from the Activity Names file

I then make the substitution, in a for loop, of the numberic code Y_train and the english description

then I aggregate the databased on subject and y_train (subject and activity code)

cleanup the duplicate columns from the aggregate

final step - write to table file