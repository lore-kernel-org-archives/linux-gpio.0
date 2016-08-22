From: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH 1/2] ARM64: dts: amlogic: gxbb: pinctrl: add pins for PWM
Date: Mon, 22 Aug 2016 16:28:42 +0200
Message-ID: <542e167e-f66e-551c-8140-bcc19a929ae8@baylibre.com>
References: <1471870450-11109-1-git-send-email-narmstrong@baylibre.com>
 <1471870450-11109-2-git-send-email-narmstrong@baylibre.com>
 <CACRpkdZuRwvS_p9D3Sx0avr+1mtCjfGFUX3fXjRRmYS19TYvxg@mail.gmail.com>
 <ee4431d1-2f78-b698-76ca-8a3afff8d0ee@baylibre.com>
 <CACRpkdYnO-9hfDjtyLhDTQjkg1FGv+rRDVjt8GRmfs=V5V5ZdA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CACRpkdYnO-9hfDjtyLhDTQjkg1FGv+rRDVjt8GRmfs=V5V5ZdA@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Kevin Hilman <khilman@baylibre.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Carlo Caione <carlo@caione.org>, "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: linux-gpio@vger.kernel.org

On 08/22/2016 04:10 PM, Linus Walleij wrote:
> On Mon, Aug 22, 2016 at 4:04 PM, Neil Armstrong <narmstrong@baylibre.com> wrote:
>> On 08/22/2016 04:02 PM, Linus Walleij wrote:
>>> On Mon, Aug 22, 2016 at 2:54 PM, Neil Armstrong <narmstrong@baylibre.com> wrote:
>>>
>>>> Add support for PWM pins, for EE and AO domains.
>>>>
>>>> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
>>>
>>> The $SUBJECT of this patch is titallyt wrong, it should be
>>> just pinctrl: (something).
>>>
>>> Should I fix it up or would you like to resend?
>>>
>>> It looks nice otherwise.
>>>
>>> Yours,
>>> Linus Walleij
>>>
>>
>> Hi Linus,
>>
>> Yes, sorry I missed the subject.
>>
>> If you can fixup, it would be great !
> 
> Hm I tried but the patch does not apply on my "devel" branch
> in pinctrl. I chicken out and ask you to rebase it, there are a few
> other patches to this driver in the devel branch.
> 
> Yours,
> Linus Walleij
> 

Hi,

This patch applies perfectly on the current kernel/git/linusw/linux-gpio.git devel branch at 7d9e59ce761f2ebe0bf57e6467cc13d932ee109b "gpio: wcove-gpio: add get_direction method".

When I rebase, the patch stays identical.

Neil
