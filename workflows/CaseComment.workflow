<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>change_status_after_comments</fullName>
        <field>Status</field>
        <literalValue>More Information Provided</literalValue>
        <name>change status after comments</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
        <targetObject>ParentId</targetObject>
    </fieldUpdates>
    <rules>
        <fullName>Comment added</fullName>
        <actions>
            <name>change_status_after_comments</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>AND(
($Profile.Name = &quot;Customer Community Plus User1&quot; || $Profile.Name = &quot;System Administrator&quot;),
$User.Id &lt;&gt; Parent.OwnerId,
NOT(ISNULL( CommentBody ))

)</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
</Workflow>
