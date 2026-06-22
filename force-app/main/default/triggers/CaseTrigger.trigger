trigger CaseTrigger on Case (
    before update,
    after update
) {

    if(Trigger.isBefore && Trigger.isUpdate) {
        CaseTriggerHandler.beforeUpdate(
            Trigger.new,
            Trigger.oldMap
        );
    }

    if(Trigger.isAfter && Trigger.isUpdate) {
        CaseTriggerHandler.afterUpdate(
            Trigger.new,
            Trigger.oldMap
        );
    }
}