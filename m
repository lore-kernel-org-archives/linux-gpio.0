From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: i.MX7 pinctrl driver writing to non existent registers
Date: Wed, 8 Mar 2017 14:57:53 +0100
Message-ID: <20170308135751.GB19934@x250>
References: <20170208090817.omm2dydhqukdzgqy@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
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
Cc: linux-gpio@vger.kernel.org, Fabio Estevam <festevam@gmail.com>, kernel@pengutronix.de, linux-arm-kernel@lists.infradead.org
List-Id: linux-gpio@vger.kernel.org

On Wed, Feb 08, 2017 at 10:08:17AM +0100, Sascha Hauer wrote:
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

Isn't property fsl,input-sel being there for addressing that?

Shawn
