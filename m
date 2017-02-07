From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 0/2] pinctrl: sunxi: Merge A31s pinctrl driver with A31
Date: Tue, 7 Feb 2017 22:54:01 +0100
Message-ID: <CACRpkdYQGyVXqq6VY=z4cnX8vRRQxOvK+YpLf6vKcbaMddwgfA@mail.gmail.com>
References: <20170201162547.24232-1-wens@csie.org>
 <20170202081332.okjxo4ogm2kp3abh@lukather>
 <CACRpkdZUOszrqbPq4Ak+pUeYQB2qBnSrE2qWMkoNzvw+E74maw@mail.gmail.com>
 <20170207150437.ob77nbtanmsijoeh@lukather>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20170207150437.ob77nbtanmsijoeh@lukather>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Chen-Yu Tsai <wens@csie.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: linux-gpio@vger.kernel.org

On Tue, Feb 7, 2017 at 4:04 PM, Maxime Ripard
<maxime.ripard@free-electrons.com> wrote:
> On Mon, Feb 06, 2017 at 11:07:33AM +0100, Linus Walleij wrote:

>> Could you guys make a patch either adding these drivers as
>> commonly maintained by you two in MAINTAINERS?
>>
>> It is commonly maintained right?
>>
>> Or if you prefer, just list the pinctrl dir under the Allwinner
>> SoC support entry?
>
> I'm not sure what you mean. We already have a wildcard matching sun*i
> in our maintainer entry, so the pinctrl driver is definitely covered.
>
> Or do you want us to add an explicit one?

No it's fine, I just didn't get it, I guess my brain is just
bad at parsing glob expressions...

Don't worry, forget it.

Yours,
Linus Walleij
