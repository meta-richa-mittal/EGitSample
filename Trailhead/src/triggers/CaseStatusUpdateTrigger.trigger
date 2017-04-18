trigger CaseStatusUpdateTrigger on FeedComment (after insert, after update) {
	CaseStatusUpdateTriggerHelper.feedCommentNewList = Trigger.new;
    CaseStatusUpdateTriggerHelper.feedCommentOldList = Trigger.old;
    CaseStatusUpdateTriggerHelper.feedCommentNewMap = Trigger.newMap;
    CaseStatusUpdateTriggerHelper.feedCommentOldMap = Trigger.oldMap;
    
    if(Trigger.isAfter) {
        if(Trigger.isInsert || Trigger.isUpdate) {
            CaseStatusUpdateTriggerHelper.updateStatusonFeedComment();
        }
    }
}