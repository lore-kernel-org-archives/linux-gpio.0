From: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH v2 1/2] pinctrl: Add Oxford Semiconductor OXNAS pinctrl
 and gpio driver
Date: Tue, 24 May 2016 11:37:15 +0200
Message-ID: <574420CB.30908@baylibre.com>
References: <1462952062-5316-1-git-send-email-narmstrong@baylibre.com>
 <1462952062-5316-2-git-send-email-narmstrong@baylibre.com>
 <CACRpkdZPMqRNn9rmcC4HYVKrdS7cxBD7O7oE4YPrP7L-0_Wakg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACRpkdZPMqRNn9rmcC4HYVKrdS7cxBD7O7oE4YPrP7L-0_Wakg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On 05/24/2016 11:35 AM, Linus Walleij wrote:
> On Wed, May 11, 2016 at 9:34 AM, Neil Armstrong <narmstrong@baylibre.com> wrote:
> 
>> Add pinctrl and gpio control support to Oxford Semiconductor OXNAS SoC Family.
>> This version supports the ARM926EJ-S based OX810SE SoC with 34 IO pins.
>>
>> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> 
> I tried implementing a .get_direction() callback for the Oxnas GPIO
> (this is good to have, for debugfs and for the new userspace ABI).
> 
> However:
> 
>> +/* GPIO Registers */
>> +#define INPUT_VALUE    0x00
>> +#define IRQ_PENDING    0x0c
>> +#define OUTPUT_SET     0x14
>> +#define OUTPUT_CLEAR   0x18
>> +#define OUTPUT_EN_SET  0x1c
>> +#define OUTPUT_EN_CLEAR        0x20
>> +#define RE_IRQ_ENABLE  0x28
>> +#define FE_IRQ_ENABLE  0x2c
> 
> No pure OUTPUT_EN register to read the direction from?
> Or is it one of the undocumented ones?
I'm not sure it was documented, I can have a look further.

> 
> Could you take a stab at implementing .get_direction() and
> send a patch?
I can have a look ASAP.

Neil
> 
> Yours,
> Linus Walleij
> 
