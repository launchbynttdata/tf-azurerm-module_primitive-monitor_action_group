package testimpl

import (
	"context"
	"os"
	"testing"

	"github.com/Azure/azure-sdk-for-go/sdk/azcore"
	"github.com/Azure/azure-sdk-for-go/sdk/azcore/arm"
	"github.com/Azure/azure-sdk-for-go/sdk/azcore/cloud"
	"github.com/Azure/azure-sdk-for-go/sdk/azidentity"
	armMonitor "github.com/Azure/azure-sdk-for-go/sdk/resourcemanager/monitor/armmonitor"
	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/launchbynttdata/lcaf-component-terratest/types"
	"github.com/stretchr/testify/assert"
)

func TestMonitorActionGroupModule(t *testing.T, ctx types.TestContext) {
	subscriptionId := os.Getenv("ARM_SUBSCRIPTION_ID")
	if len(subscriptionId) == 0 {
		t.Fatal("ARM_SUBSCRIPTION_ID environment variable is not set")
	}

	credential, err := azidentity.NewDefaultAzureCredential(nil)
	if err != nil {
		t.Fatalf("Unable to get credentials: %e\n", err)
	}

	options := arm.ClientOptions{
		ClientOptions: azcore.ClientOptions{
			Cloud: cloud.AzurePublic,
		},
	}

	armMonitorClient, err := armMonitor.NewActionGroupsClient(subscriptionId, credential, &options)
	if err != nil {
		t.Fatalf("Error getting Monitor client: %v", err)
	}

	t.Run("doesMonitorActionGroupExist", func(t *testing.T) {
		resourceGroupName := terraform.Output(t, ctx.TerratestTerraformOptions(), "resource_group_name")
		MonitorActionGroupName := terraform.Output(t, ctx.TerratestTerraformOptions(), "monitor_action_group_name")

		MonitorActionGroup, err := armMonitorClient.Get(context.Background(), resourceGroupName, MonitorActionGroupName, nil)
		if err != nil {
			t.Fatalf("Error getting MonitorActionGroup: %v", err)
		}

		assert.Equal(t, MonitorActionGroupName, *MonitorActionGroup.Name)
	})
}
