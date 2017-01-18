From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH RFC 2/5] pinctrl: mvebu: provide per-control private data
Date: Wed, 18 Jan 2017 09:55:04 +0100
Message-ID: <CACRpkdZ-Fm8=kOsVLPf6YmYkrfzqT1ZedPvLQvHfdkMNN2402Q@mail.gmail.com>
References: <20170113110240.GA29164@n2100.armlinux.org.uk>
 <E1cRzdg-0002YX-D7@rmk-PC.armlinux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <E1cRzdg-0002YX-D7@rmk-PC.armlinux.org.uk>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Russell King <rmk+kernel@armlinux.org.uk>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Andrew Lunn <andrew@lunn.ch>, Jason Cooper <jason@lakedaemon.net>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Gregory Clement <gregory.clement@free-electrons.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
List-Id: linux-gpio@vger.kernel.org

On Fri, Jan 13, 2017 at 12:03 PM, Russell King
<rmk+kernel@armlinux.org.uk> wrote:

> Provide per-control private data into each mvebu pinctrl method, which
> will allow us to provide some completely generic helpers without the
> global variable and per-instance function definitions that would be
> required when we have multiple pin controllers on a SoC.
>
> Signed-off-by: Russell King <rmk+kernel@armlinux.org.uk>

Patch applied.

Yours,
Linus Walleij
