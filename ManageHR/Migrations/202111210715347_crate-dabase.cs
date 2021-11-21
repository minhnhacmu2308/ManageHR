namespace ManageHR.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class cratedabase : DbMigration
    {
        public override void Up()
        {
            CreateTable(
                "dbo.Categories",
                c => new
                    {
                        id_category = c.Int(nullable: false, identity: true),
                        name = c.String(nullable: false, maxLength: 255),
                    })
                .PrimaryKey(t => t.id_category);
            
            CreateTable(
                "dbo.Policies",
                c => new
                    {
                        id_policy = c.Int(nullable: false, identity: true),
                        name = c.String(nullable: false, maxLength: 255),
                        id_category = c.Int(nullable: false),
                    })
                .PrimaryKey(t => t.id_policy)
                .ForeignKey("dbo.Categories", t => t.id_category, cascadeDelete: true)
                .Index(t => t.id_category);
            
            CreateTable(
                "dbo.Roles",
                c => new
                    {
                        id_role = c.Int(nullable: false, identity: true),
                        name = c.String(nullable: false, maxLength: 255),
                    })
                .PrimaryKey(t => t.id_role);
            
            CreateTable(
                "dbo.Schedules",
                c => new
                    {
                        id_schedule = c.Int(nullable: false, identity: true),
                        date = c.DateTime(nullable: false),
                        id_user = c.Int(nullable: false),
                    })
                .PrimaryKey(t => t.id_schedule)
                .ForeignKey("dbo.Users", t => t.id_user, cascadeDelete: true)
                .Index(t => t.id_user);
            
            CreateTable(
                "dbo.Users",
                c => new
                    {
                        id_user = c.Int(nullable: false, identity: true),
                        username = c.String(nullable: false, maxLength: 255),
                        email = c.String(nullable: false, maxLength: 255),
                        password = c.String(nullable: false, maxLength: 255),
                        fullname = c.String(maxLength: 255),
                        address = c.String(maxLength: 255),
                        birthday = c.DateTime(nullable: false),
                        gender = c.Int(nullable: false),
                        phoneNumber = c.String(maxLength: 255),
                        status = c.Int(nullable: false),
                        id_role = c.Int(nullable: false),
                    })
                .PrimaryKey(t => t.id_user)
                .ForeignKey("dbo.Roles", t => t.id_role, cascadeDelete: true)
                .Index(t => t.id_role);
            
        }
        
        public override void Down()
        {
            DropForeignKey("dbo.Schedules", "id_user", "dbo.Users");
            DropForeignKey("dbo.Users", "id_role", "dbo.Roles");
            DropForeignKey("dbo.Policies", "id_category", "dbo.Categories");
            DropIndex("dbo.Users", new[] { "id_role" });
            DropIndex("dbo.Schedules", new[] { "id_user" });
            DropIndex("dbo.Policies", new[] { "id_category" });
            DropTable("dbo.Users");
            DropTable("dbo.Schedules");
            DropTable("dbo.Roles");
            DropTable("dbo.Policies");
            DropTable("dbo.Categories");
        }
    }
}
