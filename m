From: Yanjiang Jin <yanjiang.jin@hxt-semitech.com>
Subject: [PATCH] pinctrl: core: make sure strcmp() doesn't get a null parameter
Date: Sat, 29 Sep 2018 17:06:55 +0800
Message-ID: <1538212015-10374-2-git-send-email-yanjiang.jin@hxt-semitech.com>
References: <1538212015-10374-1-git-send-email-yanjiang.jin@hxt-semitech.com>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1538212015-10374-1-git-send-email-yanjiang.jin@hxt-semitech.com>
Sender: linux-kernel-owner@vger.kernel.org
To: jinyanjiang@gmail.com, linus.walleij@linaro.org
Cc: yanjiang.jin@hxt-semitech.com, yu.zheng@hxt-semitech.com, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

Some drivers, for example, QCOM's qdf2xxx, set groups[gpio].name only
when gpio is valid, and leave invalid gpio names as null.
If we want to access the sys node "pinconf-groups",
pinctrl_get_group_selector() -> get_group_name() may return a null
pointer if group_selector is invalid, then the below Kernel panic
would happen since strcmp() uses this null pointer to do comparison.

 Unable to handle kernel NULL pointer dereference at ss 00000000
el:Internal error: Oops: 9600000[ 143.080279]
SMP
 CPU: 19 PID: 2493 Comm: read_all Tainted: G O
.aarch64 #1
 Hardware name: HXT Semiconductor HXT REP-2 System
 PC is at strcmp+0x18/0x154
 LR is at pinctrl_get_group_selector+0x6c/0xe8
 Process read_all (pid: 2493, stack limit =
 Call trace:
 Exception stack
  strcmp+0x18/0x154
  pin_config_group_get+0x64/0xd8
  pinconf_generic_dump_one+0xd8/0x1c0
  pinconf_generic_dump_pins+0x94/0xc8
  pinconf_groups_show+0xb4/0x104
  seq_read+0x178/0x464
  full_proxy_read+0x6c/0xac
  __vfs_read+0x58/0x178
  vfs_read+0x94/0x164
  SyS_read+0x60/0xc0
  __sys_trace_return+0x0/0x4
 --[ end trace]--
 Kernel panic - not syncing: Fatal exception

Signed-off-by: Yanjiang Jin <yanjiang.jin@hxt-semitech.com>
---
 drivers/pinctrl/core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/core.c b/drivers/pinctrl/core.c
index a3dd777..c6ff4d5 100644
--- a/drivers/pinctrl/core.c
+++ b/drivers/pinctrl/core.c
@@ -627,7 +627,7 @@ static int pinctrl_generic_group_name_to_selector(struct pinctrl_dev *pctldev,
        while (selector < ngroups) {
                const char *gname = ops->get_group_name(pctldev, selector);

-               if (!strcmp(function, gname))
+               if (gname && !strcmp(function, gname))
                        return selector;

                selector++;
@@ -743,7 +743,7 @@ int pinctrl_get_group_selector(struct pinctrl_dev *pctldev,
        while (group_selector < ngroups) {
                const char *gname = pctlops->get_group_name(pctldev,
                                                            group_selector);
-               if (!strcmp(gname, pin_group)) {
+               if (gname && !strcmp(gname, pin_group)) {
                        dev_dbg(pctldev->dev,
                                "found group selector %u for %s\n",
                                group_selector,
--
1.8.3.1




This email is intended only for the named addressee. It may contain information that is confidential/private, legally privileged, or copyright-protected, and you should handle it accordingly. If you are not the intended recipient, you do not have legal rights to retain, copy, or distribute this email or its contents, and should promptly delete the email and all electronic copies in your system; do not retain copies in any media. If you have received this email in error, please notify the sender promptly. Thank you.
