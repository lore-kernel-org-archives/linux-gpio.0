From: Shyam Sundar S K <ssundark@amd.com>
Subject: Re: [PATCH] pinctrl: amd: avoid maybe-uninitalized warning
Date: Thu, 12 Jan 2017 13:45:08 +0530
Message-ID: <2d8a7eeb-f49a-47eb-1b74-70631c27e931@amd.com>
References: <20170111143712.510147-1-arnd@arndb.de>
 <CACRpkdZrhrMi4SGa8RCwTzcLQDumEQjpw+LftLNEaxxRAZu8Vw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACRpkdZrhrMi4SGa8RCwTzcLQDumEQjpw+LftLNEaxxRAZu8Vw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Arnd Bergmann <arnd@arndb.de>
Cc: "Agrawal, Nitesh-kumar" <Nitesh-kumar.Agrawal@amd.com>, Pankaj Sen <Pankaj.Sen@amd.com>, "Shah, Nehal-bakulchandra" <Nehal-Bakulchandra.shah@amd.com>, Shyam-sundar S-k <Shyam-sundar.S-k@amd.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

Hi Linus,

You have already added patch for the same "[PATCH] pinctrl: amd: fix compilation warning" and applied to one of your fixed branch.

Do you feel this patch needs to be taken ?

Thanks,
Shyam

On 1/12/2017 1:19 PM, Linus Walleij wrote:
> On Wed, Jan 11, 2017 at 3:36 PM, Arnd Bergmann <arnd@arndb.de> wrote:
> 
>> Since gpio_dev->hwbank_num is now a variable, the compiler cannot
>> figure out if pin_num is initialized at all:
>>
>> drivers/pinctrl/pinctrl-amd.c: In function 'amd_gpio_dbg_show':
>> drivers/pinctrl/pinctrl-amd.c:210:3: warning: 'pin_num' may be used uninitialized in this function [-Wmaybe-uninitialized]
>>    for (; i < pin_num; i++) {
>>    ^~~
>> drivers/pinctrl/pinctrl-amd.c:172:21: warning: 'i' may be used uninitialized in this function [-Wmaybe-uninitialized]
>>
>> This adds a 'default' statement to make that case well-defined.
>>
>> Fixes: 3bfd44306c65 ("pinctrl: amd: Add support for additional GPIO")
>> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> 
> Patch applied.
> 
> Yours,
> Linus Walleij
> 
