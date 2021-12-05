namespace ManageHR.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class nguyen : DbMigration
    {
        public override void Up()
        {
            AddColumn("dbo.Policies", "content", c => c.String(maxLength: 1000));
            AddColumn("dbo.Policies", "format", c => c.String(maxLength: 1000));
            AddColumn("dbo.Policies", "note", c => c.String(maxLength: 1000));
            AddColumn("dbo.Users", "startDay", c => c.DateTime(nullable: false));
            AddColumn("dbo.Users", "identityCard", c => c.String(maxLength: 255));
            AddColumn("dbo.Users", "bankAccount", c => c.String(maxLength: 255));
            AddColumn("dbo.Users", "request", c => c.String(maxLength: 1000));
        }
        
        public override void Down()
        {
            DropColumn("dbo.Users", "request");
            DropColumn("dbo.Users", "bankAccount");
            DropColumn("dbo.Users", "identityCard");
            DropColumn("dbo.Users", "startDay");
            DropColumn("dbo.Policies", "note");
            DropColumn("dbo.Policies", "format");
            DropColumn("dbo.Policies", "content");
        }
    }
}
