From: Gang Liu <gang.liu@nxp.com>
Subject: RE: [PATCH 2/2 V3] drivers/gpio: Switch gpio-mpc8xxx to use
 gpio-generic
Date: Mon, 25 Jan 2016 07:47:26 +0000
Message-ID: <DB4PR04MB2666CE201148F0E41CE376382C70@DB4PR04MB266.eurprd04.prod.outlook.com>
References: <1452600610-17400-1-git-send-email-Gang.Liu@nxp.com>
 <1452600610-17400-2-git-send-email-Gang.Liu@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1452600610-17400-2-git-send-email-Gang.Liu@nxp.com>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: "linus.walleij@linaro.org" <linus.walleij@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Cc: Leo Li <leo.li@nxp.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, Bhupesh Sharma <bhupesh.sharma@nxp.com>, Scott Wood <scott.wood@nxp.com>
List-Id: linux-gpio@vger.kernel.org

Hi, Linus Walleij,

I rewrote the patches following your comments based on the gpio-generic infrastructure. 
Do you have some comments for the new patches? Or could you please help to apply the patches?

Thanks!
Liu Gang

-----Original Message-----
From: Liu Gang [mailto:Gang.Liu@nxp.com] 
Sent: Tuesday, January 12, 2016 8:10 PM
To: linus.walleij@linaro.org; linux-gpio@vger.kernel.org; linux-arm-kernel@lists.infradead.org
Cc: robh+dt@kernel.org; Bhupesh Sharma <bhupesh.sharma@nxp.com>; scottwood@nxp.com; LeoLi@nxp.com; Gang Liu <gang.liu@nxp.com>; Gang Liu <gang.liu@nxp.com>
Subject: [PATCH 2/2 V3] drivers/gpio: Switch gpio-mpc8xxx to use gpio-generic

The new Layerscape platforms has the same ip block/controller as GPIO on PowerPC platforms(MPC8XXX), but the GPIO registers may be big or little endian. So the code needs to get the endian property from DTB, then make additional functions to fit all the PowerPC/Layerscape GPIO register read/write operations.

gpio-generic.c provides an universal infrastructure for both big and little endian register operations. So switch the gpio-mpc8xxx to use gpio-generic can simplify the driver and reduce a lot of code.

The IRQ and some workaround parts in gpio-mpc8xxx.c will be updated with the new API interfaces but following the original functionalities.

Signed-off-by: Liu Gang <Gang.Liu@nxp.com>
---
-V3: Switch gpio-mpc8xxx to use gpio-generic for both
     little, big endian kinds of GPIO register following
     Linus Walleij comments.

 drivers/gpio/gpio-mpc8xxx.c | 270 ++++++++++++++++++--------------------------
 1 file changed, 109 insertions(+), 161 deletions(-)
