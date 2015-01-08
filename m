From: Jim Lin <jilin@nvidia.com>
Subject: [PATCH 1/1] pinctrl: Fix two deadlocks
Date: Thu, 8 Jan 2015 20:25:05 +0800
Message-ID: <1420719905-15994-1-git-send-email-jilin@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linus.walleij@linaro.org
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Jim Lin <jilin@nvidia.com>
List-Id: linux-gpio@vger.kernel.org

This patch is to fix two deadlock cases.
Deadlock 1:
CPU #1
 pinctrl_register-> pinctrl_get ->
 create_pinctrl
 (Holding lock pinctrl_maps_mutex)
 -> get_pinctrl_dev_from_devname
 (Trying to acquire lock pinctrldev_list_mutex)
CPU #0
 pinctrl_unregister
 (Holding lock pinctrldev_list_mutex)
 -> pinctrl_put ->> pinctrl_free ->
 pinctrl_dt_free_maps -> pinctrl_unregister_map
 (Trying to acquire lock pinctrl_maps_mutex)

Simply to say
CPU#1 is holding lock A and trying to acquire lock B,
CPU#0 is holding lock B and trying to acquire lock A.

Deadlock 2:
CPU #3
 pinctrl_register-> pinctrl_get ->
 create_pinctrl
 (Holding lock pinctrl_maps_mutex)
 -> get_pinctrl_dev_from_devname
 (Trying to acquire lock pinctrldev_list_mutex)
CPU #2
 pinctrl_unregister
 (Holding lock pctldev->mutex)
 -> pinctrl_put ->> pinctrl_free ->
 pinctrl_dt_free_maps -> pinctrl_unregister_map
 (Trying to acquire lock pinctrl_maps_mutex)
CPU #0
 tegra_gpio_request
 (Holding lock pinctrldev_list_mutex)
 -> pinctrl_get_device_gpio_range
 (Trying to acquire lock pctldev->mutex)

Simply to say
CPU#3 is holding lock A and trying to acquire lock D,
CPU#2 is holding lock B and trying to acquire lock A,
CPU#0 is holding lock D and trying to acquire lock B.

Signed-off-by: Jim Lin <jilin@nvidia.com>
---
 drivers/pinctrl/core.c |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/core.c b/drivers/pinctrl/core.c
index e4f65510c87e..89dca77ca038 100644
--- a/drivers/pinctrl/core.c
+++ b/drivers/pinctrl/core.c
@@ -1801,14 +1801,15 @@ void pinctrl_unregister(struct pinctrl_dev *pctldev)
 	if (pctldev == NULL)
 		return;
 
-	mutex_lock(&pinctrldev_list_mutex);
 	mutex_lock(&pctldev->mutex);
-
 	pinctrl_remove_device_debugfs(pctldev);
+	mutex_unlock(&pctldev->mutex);
 
 	if (!IS_ERR(pctldev->p))
 		pinctrl_put(pctldev->p);
 
+	mutex_lock(&pinctrldev_list_mutex);
+	mutex_lock(&pctldev->mutex);
 	/* TODO: check that no pinmuxes are still active? */
 	list_del(&pctldev->node);
 	/* Destroy descriptor tree */
-- 
1.7.7
