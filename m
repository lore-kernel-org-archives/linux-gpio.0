From: Christian Lamparter <chunkeey@gmail.com>
Subject: Re: [PATCH] pinctrl: msm: fix gpio-hog related boot issues
Date: Thu, 29 Mar 2018 16:05:47 +0200
Message-ID: <3460672.7sj45fLQN6@debian64>
References: <20180328180705.29147-1-chunkeey@gmail.com>
 <20180329002723.GD18510@minitux> <5240033.8XEdSWCWGL@debian64>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <5240033.8XEdSWCWGL@debian64>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, David Brown <david.brown@linaro.org>, Sven Eckelmann <sven.eckelmann@openmesh.com>, Andy Gross <andy.gross@linaro.org>, linux-arm-kernel@lists.infradead.org
List-Id: linux-gpio@vger.kernel.org

On Thu 29 Mar 2018 14:23:35 CEST Christian Lamparter wrote:
> Ok I see, I was aware of ACPI but not that a pinctrl-msm based driver is
> using it. Well, I thinks is possible to use is_acpi_device_node() or 
> !is_of_node() to detect whenever we are dealing with a OF or not:
> 
> would it be ok to do something like this?
> 
> |       if (!is_of_node(chip->of_node)) {
oops, this should be:
			if (!is_of_node(pctrl->dev->fwnode)) {
> |					/*
> |					 * (lengthy note about gpiochip_add_pin_range and OF with
> |					 * reference to Documentation/devicetree/bindings/gpio/gpio.txt
> |					 * - TBD)
> |					 */
> |					ret = gpiochip_add_pin_range(&pctrl->chip,
> |					[...]
> |		}
