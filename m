From: Yanjiang Jin <yanjiang.jin@hxt-semitech.com>
Subject: [PATCH] How to reproduce this issue
Date: Sat, 29 Sep 2018 17:06:54 +0800
Message-ID: <1538212015-10374-1-git-send-email-yanjiang.jin@hxt-semitech.com>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: jinyanjiang@gmail.com, linus.walleij@linaro.org
Cc: yanjiang.jin@hxt-semitech.com, yu.zheng@hxt-semitech.com, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

On my HXT Semiconductor REP-2 board, I can use a LTP case "read_all"
to reproduce it as below:

/opt/ltp/runltp -f fs -s read_all_sys

or

read_all -d /sys -q -r 10

Or just simply visit the sys node "QCOM8002's pinconf-groups":

"cat /sys/kernel/debug/pinctrl/QCOM8002\:00/pinconf-groups"


Yanjiang Jin (1):
  pinctrl: core: make sure strcmp() doesn't get a null parameter

 drivers/pinctrl/core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

--
1.8.3.1




This email is intended only for the named addressee. It may contain information that is confidential/private, legally privileged, or copyright-protected, and you should handle it accordingly. If you are not the intended recipient, you do not have legal rights to retain, copy, or distribute this email or its contents, and should promptly delete the email and all electronic copies in your system; do not retain copies in any media. If you have received this email in error, please notify the sender promptly. Thank you.
