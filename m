From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [patch] gpio: Added GPIO support to ZynqMP SoC
Date: Thu, 4 Jun 2015 10:07:57 +0200
Message-ID: <CACRpkdZpvr4NfH43FvoHdfKaqqDGMHJU5=UHEzOpLV9xC4vaTw@mail.gmail.com>
References: <1433160019-11157-1-git-send-email-anuragku@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1433160019-11157-1-git-send-email-anuragku@xilinx.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Anurag Kumar Vulisha <anurag.kumar.vulisha@xilinx.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, Anurag Kumar Vulisha <anuragku@xilinx.com>, svemula@xilinx.com, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Michal Simek <michal.simek@xilinx.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, =?UTF-8?Q?S=C3=B6ren_Brinkmann?= <soren.brinkmann@xilinx.com>, anirudh@xilinx.com, punnaia@xilinx.com, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: linux-gpio@vger.kernel.org

On Mon, Jun 1, 2015 at 2:00 PM, Anurag Kumar Vulisha
<anurag.kumar.vulisha@xilinx.com> wrote:

> Added support to ZynqMP SoC on the existing zynq gpio driver.
>
> Signed-off-by: Anurag Kumar Vulisha <anuragku@xilinx.com>

> +static const struct of_device_id zynq_gpio_of_match[] = {
> +       { .compatible = "xlnx,zynq-gpio-1.0", .data = (void *)&zynq_gpio_def },
> +       { .compatible = "xlnx,zynqmp-gpio-1.0",
> +                                       .data = (void *)&zynqmp_gpio_def },

Is there a separate patch adding this to the device tree
bindings in Documentation/devicetree/bindings/gpio/gpio-zynq.txt?

Else please include it in this patch.

Yours,
Linus Walleij
