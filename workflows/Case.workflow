<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>Case_Is_On_High_Priority</fullName>
        <description>Case Is On High Priority</description>
        <protected>false</protected>
        <recipients>
            <field>SuppliedEmail</field>
            <type>email</type>
        </recipients>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderType>DefaultWorkflowUser</senderType>
        <template>Email_templates_for_Approval_and_reject/Priority_Is_High_Alert</template>
    </alerts>
    <alerts>
        <fullName>Case_Reverted</fullName>
        <description>Case Reverted.</description>
        <protected>false</protected>
        <recipients>
            <type>creator</type>
        </recipients>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderType>DefaultWorkflowUser</senderType>
        <template>Email_templates_for_Approval_and_reject/Email_for_Revert_Case</template>
    </alerts>
    <alerts>
        <fullName>Comment_is_added</fullName>
        <description>Comment is added</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderType>DefaultWorkflowUser</senderType>
        <template>Email_templates_for_Approval_and_reject/comment_added</template>
    </alerts>
    <alerts>
        <fullName>Creation_Mail_Email_to_Case_Creator</fullName>
        <description>Creation Mail Email to Case Creator</description>
        <protected>false</protected>
        <recipients>
            <field>SuppliedEmail</field>
            <type>email</type>
        </recipients>
        <senderType>DefaultWorkflowUser</senderType>
        <template>Email_templates_for_Approval_and_reject/Other_Ticket_creation_Email_Template</template>
    </alerts>
    <alerts>
        <fullName>Email_Alert_for_ticket_creation</fullName>
        <description>Email Alert for ticket creation</description>
        <protected>false</protected>
        <recipients>
            <type>creator</type>
        </recipients>
        <recipients>
            <field>ContactEmail</field>
            <type>email</type>
        </recipients>
        <senderType>DefaultWorkflowUser</senderType>
        <template>Email_templates_for_Approval_and_reject/Email_for_ticket_creation</template>
    </alerts>
    <alerts>
        <fullName>Email_to_Case_Send_Email</fullName>
        <ccEmails>garimavyas215@gmail.com,kirtipathankar99@gmail.com</ccEmails>
        <description>Email to Case Send Email</description>
        <protected>false</protected>
        <recipients>
            <type>creator</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Email_templates_for_Approval_and_reject/Other_Ticket_creation_Email_Template</template>
    </alerts>
    <alerts>
        <fullName>More_Info_needed</fullName>
        <description>More Info needed</description>
        <protected>false</protected>
        <recipients>
            <type>creator</type>
        </recipients>
        <recipients>
            <field>ContactEmail</field>
            <type>email</type>
        </recipients>
        <senderType>DefaultWorkflowUser</senderType>
        <template>Email_templates_for_Approval_and_reject/More_Info_needed_on_ticket</template>
    </alerts>
    <alerts>
        <fullName>Notify_user</fullName>
        <description>Notify user</description>
        <protected>false</protected>
        <recipients>
            <type>creator</type>
        </recipients>
        <recipients>
            <field>SuppliedEmail</field>
            <type>email</type>
        </recipients>
        <senderType>DefaultWorkflowUser</senderType>
        <template>Email_templates_for_Approval_and_reject/Notify_user</template>
    </alerts>
    <alerts>
        <fullName>Other_Ticket_Creation_email_alert</fullName>
        <description>Other Ticket Creation email alert</description>
        <protected>false</protected>
        <recipients>
            <type>creator</type>
        </recipients>
        <recipients>
            <field>ContactEmail</field>
            <type>email</type>
        </recipients>
        <senderType>DefaultWorkflowUser</senderType>
        <template>Email_templates_for_Approval_and_reject/Other_Ticket_creation_Email_Template</template>
    </alerts>
    <alerts>
        <fullName>Reopen_Case</fullName>
        <description>Reopen Case</description>
        <protected>false</protected>
        <recipients>
            <field>ContactEmail</field>
            <type>email</type>
        </recipients>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Email_templates_for_Approval_and_reject/Reopen_Case</template>
    </alerts>
    <alerts>
        <fullName>Request_Ticket_Queue</fullName>
        <description>Request Ticket Queue</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderType>DefaultWorkflowUser</senderType>
        <template>Email_templates_for_Approval_and_reject/Request_ticket_Queues</template>
    </alerts>
    <alerts>
        <fullName>Requestor_Approved_the_ticket</fullName>
        <description>Requestor Approved the ticket</description>
        <protected>false</protected>
        <recipients>
            <type>creator</type>
        </recipients>
        <recipients>
            <field>SuppliedEmail</field>
            <type>email</type>
        </recipients>
        <senderType>DefaultWorkflowUser</senderType>
        <template>Email_templates_for_Approval_and_reject/Ticket_Closed_Template_for_Requester</template>
    </alerts>
    <alerts>
        <fullName>Requestor_Rejected_the_ticket_they_not_satisfy_with_solution</fullName>
        <description>Requestor Rejected the ticket they not satisfy with solution</description>
        <protected>false</protected>
        <recipients>
            <field>SuppliedEmail</field>
            <type>email</type>
        </recipients>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderType>DefaultWorkflowUser</senderType>
        <template>Email_templates_for_Approval_and_reject/Resolution_Rejected</template>
    </alerts>
    <alerts>
        <fullName>Send_Email_for_creation</fullName>
        <ccEmails>nvanare@gmail.com</ccEmails>
        <description>Send email for creation</description>
        <protected>false</protected>
        <recipients>
            <type>creator</type>
        </recipients>
        <recipients>
            <field>ContactEmail</field>
            <type>email</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Email_templates_for_Approval_and_reject/Email_for_ticket_creation</template>
    </alerts>
    <alerts>
        <fullName>Send_Others_queues</fullName>
        <ccEmails>servicecasemate@gmail.com</ccEmails>
        <description>Send Others queues</description>
        <protected>false</protected>
        <recipients>
            <recipient>varshu@gmail.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>DefaultWorkflowUser</senderType>
        <template>Email_templates_for_Approval_and_reject/Others</template>
    </alerts>
    <alerts>
        <fullName>Send_email_for_Technology</fullName>
        <description>Send_email_for_Technology</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Email_templates_for_Approval_and_reject/Request_ticket_Queues</template>
    </alerts>
    <alerts>
        <fullName>Send_email_for_approval_process</fullName>
        <description>Send email for approval process.</description>
        <protected>false</protected>
        <recipients>
            <type>creator</type>
        </recipients>
        <recipients>
            <field>ContactEmail</field>
            <type>email</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Email_templates_for_Approval_and_reject/Case_Email</template>
    </alerts>
    <alerts>
        <fullName>Support_Ticket</fullName>
        <description>Support Ticket</description>
        <protected>false</protected>
        <recipients>
            <field>SuppliedEmail</field>
            <type>email</type>
        </recipients>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderType>DefaultWorkflowUser</senderType>
        <template>Email_templates_for_Approval_and_reject/Support_Ticket</template>
    </alerts>
    <alerts>
        <fullName>Ticket_Resolution</fullName>
        <description>Ticket Resolution</description>
        <protected>false</protected>
        <recipients>
            <type>creator</type>
        </recipients>
        <recipients>
            <field>ContactEmail</field>
            <type>email</type>
        </recipients>
        <senderType>DefaultWorkflowUser</senderType>
        <template>Email_templates_for_Approval_and_reject/Ticket_Closed_Template_for_Requester</template>
    </alerts>
    <alerts>
        <fullName>Ticket_closed_alert_for_agent</fullName>
        <description>Ticket closed alert for agent</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Email_templates_for_Approval_and_reject/Ticket_Closed</template>
    </alerts>
    <alerts>
        <fullName>Ticket_is_approved</fullName>
        <description>Ticket is approved</description>
        <protected>false</protected>
        <recipients>
            <field>ContactEmail</field>
            <type>email</type>
        </recipients>
        <recipients>
            <field>SuppliedEmail</field>
            <type>email</type>
        </recipients>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderType>DefaultWorkflowUser</senderType>
        <template>Email_templates_for_Approval_and_reject/Ticket_is_Approved</template>
    </alerts>
    <alerts>
        <fullName>When_Case_Is_created</fullName>
        <description>When Case Is created</description>
        <protected>false</protected>
        <recipients>
            <field>ContactEmail</field>
            <type>email</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Email_templates_for_Approval_and_reject/Email_for_ticket_creation</template>
    </alerts>
    <alerts>
        <fullName>approval_mail_for_web_to_case</fullName>
        <description>approval mail for web to case</description>
        <protected>false</protected>
        <recipients>
            <field>SuppliedEmail</field>
            <type>email</type>
        </recipients>
        <senderType>DefaultWorkflowUser</senderType>
        <template>Email_templates_for_Approval_and_reject/Case_Email</template>
    </alerts>
    <alerts>
        <fullName>bot_creation_mail</fullName>
        <ccEmails>varshudhote@gmail.com</ccEmails>
        <description>bot creation mail</description>
        <protected>false</protected>
        <recipients>
            <type>creator</type>
        </recipients>
        <senderType>DefaultWorkflowUser</senderType>
        <template>Email_templates_for_Approval_and_reject/Email_creation_for_chatbot</template>
    </alerts>
    <alerts>
        <fullName>notify_requestor_about_case_received</fullName>
        <description>notify requestor about case received</description>
        <protected>false</protected>
        <recipients>
            <field>SuppliedEmail</field>
            <type>email</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Email_templates_for_Approval_and_reject/Email_Alert_to_notify_user</template>
    </alerts>
    <fieldUpdates>
        <fullName>Approval_ticket</fullName>
        <description>Ticket is in working .</description>
        <field>Status</field>
        <literalValue>Resolved</literalValue>
        <name>Approval ticket</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>ChangePriorityToHigh</fullName>
        <field>Priority</field>
        <literalValue>High</literalValue>
        <name>Changes the case priority to high.</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Change_case_origin</fullName>
        <field>Origin</field>
        <literalValue>community</literalValue>
        <name>Change case origin</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Check_Pause_milestone</fullName>
        <field>IsStopped</field>
        <literalValue>1</literalValue>
        <name>Check Pause milestone</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Closed_Status</fullName>
        <field>Status</field>
        <literalValue>Closed</literalValue>
        <name>Closed Status</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Closed_status_changed</fullName>
        <field>Status</field>
        <literalValue>Closed</literalValue>
        <name>Changed Closed status</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Continue_Milestone</fullName>
        <field>IsStopped</field>
        <literalValue>0</literalValue>
        <name>Continue Milestone</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Continue_Milestone1</fullName>
        <field>IsStopped</field>
        <literalValue>0</literalValue>
        <name>Continue Milestone1</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>DurationPriority</fullName>
        <field>Priority</field>
        <literalValue>High</literalValue>
        <name>DurationPriority</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Status_Closed</fullName>
        <field>Status</field>
        <literalValue>Closed</literalValue>
        <name>Status Closed</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Ticket_is_Approved</fullName>
        <description>Requestor approved this ticket.</description>
        <field>Status</field>
        <literalValue>Closed</literalValue>
        <name>Ticket is  Approved</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Ticket_is_Reject</fullName>
        <field>Status</field>
        <literalValue>In Progress</literalValue>
        <name>Ticket is Reject</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_continue_Milestone</fullName>
        <field>IsStopped</field>
        <literalValue>0</literalValue>
        <name>Update continue Milestone</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>caseStoppedUpdate</fullName>
        <field>IsStopped</field>
        <literalValue>0</literalValue>
        <name>caseStoppedUpdate</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>case_Type_Update</fullName>
        <field>Case_Type__c</field>
        <literalValue>Other</literalValue>
        <name>case Type Update</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>case_status_close</fullName>
        <field>Status</field>
        <literalValue>Closed</literalValue>
        <name>case status close</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>change_owner</fullName>
        <field>OwnerId</field>
        <lookupValue>varshudhote@creative-panda-q4n7cj.com</lookupValue>
        <lookupValueType>User</lookupValueType>
        <name>change owner</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>change_to_resolved</fullName>
        <field>Status</field>
        <literalValue>Resolved</literalValue>
        <name>change to resolved</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>changed_status_to_close</fullName>
        <field>Status</field>
        <literalValue>Closed</literalValue>
        <name>changed status to close</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>close_case</fullName>
        <field>Status</field>
        <literalValue>Closed</literalValue>
        <name>close case</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>pause_milestone</fullName>
        <field>IsStopped</field>
        <literalValue>1</literalValue>
        <name>pause milestone</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>pause_milestones</fullName>
        <field>IsStopped</field>
        <literalValue>1</literalValue>
        <name>pause milestones</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>status_to_inprogress</fullName>
        <field>Status</field>
        <literalValue>In Progress</literalValue>
        <name>status to inprogress</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>updateStoppedMilestone</fullName>
        <field>IsStopped</field>
        <literalValue>0</literalValue>
        <name>updateStoppedMilestone</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <rules>
        <fullName>Accept resolution</fullName>
        <actions>
            <name>Ticket_is_approved</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>changed_status_to_close</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.Accept_Revert_Resolution__c</field>
            <operation>equals</operation>
            <value>Accept</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Case Priority is High</fullName>
        <actions>
            <name>Case_Is_On_High_Priority</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Case.Case_Priority__c</field>
            <operation>equals</operation>
            <value>High</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Case origin for community</fullName>
        <actions>
            <name>Change_case_origin</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.Origin</field>
            <operation>equals</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Email to Case Creation</fullName>
        <actions>
            <name>Email_Alert_for_ticket_creation</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Case.Origin</field>
            <operation>equals</operation>
            <value>Email</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Email to Case Creation for bot</fullName>
        <actions>
            <name>bot_creation_mail</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.Origin</field>
            <operation>equals</operation>
            <value>Bot</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Status</field>
            <operation>equals</operation>
            <value>New</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>More Info needed on ticket</fullName>
        <actions>
            <name>More_Info_needed</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>pause_milestones</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Case.Status</field>
            <operation>equals</operation>
            <value>More Information needed</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>More Info provided</fullName>
        <actions>
            <name>Comment_is_added</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Case.Status</field>
            <operation>equals</operation>
            <value>More Information Provided</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Notify customer</fullName>
        <actions>
            <name>notify_requestor_about_case_received</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.Notified_Customer__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Notify user</fullName>
        <actions>
            <name>Notify_user</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.Notify_User__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Re open case</fullName>
        <actions>
            <name>Reopen_Case</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>status_to_inprogress</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Case.Accept_Revert_Resolution__c</field>
            <operation>equals</operation>
            <value>Reopen</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Resolution revert</fullName>
        <actions>
            <name>Requestor_Rejected_the_ticket_they_not_satisfy_with_solution</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Case.Case_Comment__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Resolved status</fullName>
        <actions>
            <name>Send_email_for_approval_process</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Case.Status</field>
            <operation>equals</operation>
            <value>Resolved</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Revert</fullName>
        <actions>
            <name>Case_Reverted</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Case.Case_Comment__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Reason</field>
            <operation>equals</operation>
            <value>Revertcase</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Send Case Creation Mail to Email to Case Cases</fullName>
        <actions>
            <name>Other_Ticket_Creation_email_alert</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <booleanFilter>1 OR 2</booleanFilter>
        <criteriaItems>
            <field>Case.Origin</field>
            <operation>equals</operation>
            <value>Email</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Origin</field>
            <operation>equals</operation>
            <value>Web</value>
        </criteriaItems>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Update contacts for bot origin</fullName>
        <active>false</active>
        <criteriaItems>
            <field>Case.Origin</field>
            <operation>equals</operation>
            <value>Bot</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>case close</fullName>
        <active>false</active>
        <criteriaItems>
            <field>Case.Status</field>
            <operation>equals</operation>
            <value>Resolved</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
        <workflowTimeTriggers>
            <actions>
                <name>close_case</name>
                <type>FieldUpdate</type>
            </actions>
            <timeLength>1</timeLength>
            <workflowTimeTriggerUnit>Hours</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules>
    <rules>
        <fullName>caseUpdateCloseddate</fullName>
        <active>false</active>
        <criteriaItems>
            <field>Case.Status</field>
            <operation>equals</operation>
            <value>Closed</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>change owner</fullName>
        <actions>
            <name>change_owner</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Case.CounterRequestor__c</field>
            <operation>greaterOrEqual</operation>
            <value>6</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>comment added email</fullName>
        <actions>
            <name>Comment_is_added</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Update_continue_Milestone</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.Status</field>
            <operation>equals</operation>
            <value>More Information Provided</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>product to other</fullName>
        <active>false</active>
        <criteriaItems>
            <field>Case.Product_Category__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>request agent mail</fullName>
        <actions>
            <name>Request_Ticket_Queue</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <formula>AND(      ISPICKVAL(Status, &quot;New&quot;),      ISCHANGED(OwnerId)    )</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>submit resolution</fullName>
        <actions>
            <name>Send_email_for_approval_process</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>change_to_resolved</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Case.Resolution_Comment__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>submit resolution for web to case</fullName>
        <actions>
            <name>approval_mail_for_web_to_case</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>change_to_resolved</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <booleanFilter>1 AND (2 OR 3)</booleanFilter>
        <criteriaItems>
            <field>Case.Resolution_Comment__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Origin</field>
            <operation>equals</operation>
            <value>Web</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Origin</field>
            <operation>equals</operation>
            <value>Email</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>updateStoppedField</fullName>
        <actions>
            <name>updateStoppedMilestone</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.Status</field>
            <operation>equals</operation>
            <value>In_Progress</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
</Workflow>
