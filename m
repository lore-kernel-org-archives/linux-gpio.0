From: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
Subject: Re: i.MX7 pinctrl driver writing to non existent registers
Date: Wed, 8 Feb 2017 23:28:33 +0800
Message-ID: <9D4713C3-26F1-4041-A227-51A8A2EEB3C1@jcrosoft.com>
References: <20170208090817.omm2dydhqukdzgqy@pengutronix.de>
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20170208090817.omm2dydhqukdzgqy@pengutronix.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>, linux-gpio@vger.kernel.org, kernel@pengutronix.de, Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <festevam@gmail.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-gpio@vger.kernel.org


> On Feb 8, 2017, at 5:08 PM, Sascha Hauer <s.hauer@pengutronix.de> wrote:
> 
> Hi All,
> 
> The i.MX7 has two pinmux controllers, the LPSR and the regular one. We
> instantiate a driver for each one. Now the driver assumes that the pins
> are completely configured with one iomux controller, but for the LPSR
> pins this is not true: The MUX_CTL and PAD_CTL registers are indeed
> in the LPSR controller, but the SELECT_INPUT registers for the same
> pin are found in the regular controller.
> 
> The result is that with this pin for example:
> 
> #define MX7D_PAD_GPIO1_IO06__UART5_DCE_RX                         0x0018 0x0048 0x0714 0x3 0x4
> 
> The LPSR controller writes to LPSR_BASE + 0x714 where it should really
> be IOMUX_BASE + 0x714.
> 
> I have no idea how to fix this. We could split the LPSR pins into two
> pins, one for each controller. Another possibility would be to create
> some kind of shortcut from one controller to control the other one. Also
> not nice. Also we could simply do nothing, as long as the bootloader
> configures everything correctly we won't even notice ;)
Always expect a bootloader is wrong and do it properly in the kernel
as if you have 2 bootloader they may do different configuration and as the end
found the problem in the kernel on one board and not the other.

Best Regards,
J.
