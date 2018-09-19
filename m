From: Keerthy <j-keerthy@ti.com>
Subject: Re: [PATCH 2/5] gpio: davinci: Use dev name for label and automatic
 base selection
Date: Wed, 19 Sep 2018 09:38:08 +0530
Message-ID: <1b1199c7-2e3a-4f65-0da4-1cbdae219537@ti.com>
References: <20180831191326.25106-1-afd@ti.com>
 <20180831191326.25106-2-afd@ti.com>
 <CACRpkdYmYHL1vrRFeyuO6immh9ZtVPeiOo+=ZB9T=CHe1yGTxg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACRpkdYmYHL1vrRFeyuO6immh9ZtVPeiOo+=ZB9T=CHe1yGTxg@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, "Andrew F. Davis" <afd@ti.com>
Cc: "Nori, Sekhar" <nsekhar@ti.com>, Kevin Hilman <khilman@kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org



On Wednesday 19 September 2018 12:56 AM, Linus Walleij wrote:
> On Fri, Aug 31, 2018 at 12:13 PM Andrew F. Davis <afd@ti.com> wrote:
> 
>> Use dev_name to get a unique label and use -1 for a base to get our
>> selection automatically. We pull in all GPIOs per chip now so this
>> does not have the effect of out of order labels like before.
>>
>> We do these both together so we can drop all the static data in one
>> patch. This also lets us normalize the return paths as we don't need
>> any cleanup after this change.
>>
>> Signed-off-by: Andrew F. Davis <afd@ti.com>
> 
> I have tentatively applied this patch set as we seem to have rough
> consensus that it will be OK.
> 
> We can always pull it out or revert it if things break.

Okay. If that is the case then i have already tested the entire series.

Apart from gpio numbering different, i have tested toggling and
interrupts with k2g-evm and omapl138.

> 
> Yours,
> Linus Walleij
> 
