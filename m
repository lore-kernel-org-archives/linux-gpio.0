From: SF Markus Elfring <elfring@users.sourceforge.net>
Subject: [PATCH 0/5] pinctrl-mvebu: Fine-tuning for four function
 implementations
Date: Thu, 12 Jan 2017 17:30:12 +0100
Message-ID: <12880bc6-1695-074a-788b-dd936f6f795a@users.sourceforge.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-gpio@vger.kernel.org, Laxman Dewangan <ldewangan@nvidia.com>, Linus Walleij <linus.walleij@linaro.org>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 12 Jan 2017 17:25:17 +0100

A few update suggestions were taken into account
from static source code analysis.

Markus Elfring (5):
  Use kmalloc_array() in mvebu_pinctrl_dt_node_to_map()
  Delete an error message for a failed memory allocation in three functions
  Delete an unnecessary return statement in mvebu_pinconf_group_dbg_show()
  Use seq_puts() in mvebu_pinconf_group_dbg_show()
  Use seq_putc() in mvebu_pinconf_group_dbg_show()

 drivers/pinctrl/mvebu/pinctrl-mvebu.c | 42 ++++++++++++++---------------------
 1 file changed, 17 insertions(+), 25 deletions(-)

-- 
2.11.0
