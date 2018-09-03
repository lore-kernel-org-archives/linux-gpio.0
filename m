From: Michael Hennerich <michael.hennerich@analog.com>
Subject: Re: [PATCH] drivers: gpio: gpio-adp5588: Fix sleep-in-atomic-context
 bug
Date: Mon, 3 Sep 2018 08:57:18 +0200
Message-ID: <e8df3855-6380-697e-5ce0-37eb1e6bbf75@analog.com>
References: <1534168664-13034-1-git-send-email-michael.hennerich@analog.com>
 <CACRpkdbw3DwYO=W7m5AaNkg8QZmCf+7yM4fNs7tBVDZgVma2wg@mail.gmail.com>
Reply-To: <michael.hennerich@analog.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACRpkdbw3DwYO=W7m5AaNkg8QZmCf+7yM4fNs7tBVDZgVma2wg@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, baijiaju1990@gmail.com
List-Id: linux-gpio@vger.kernel.org

On 29.08.2018 10:55, Linus Walleij wrote:
> On Mon, Aug 13, 2018 at 3:53 PM <michael.hennerich@analog.com> wrote:
> 
>> From: Michael Hennerich <michael.hennerich@analog.com>
>>
>> This fixes:
>> [BUG] gpio: gpio-adp5588: A possible sleep-in-atomic-context bug
>>                            in adp5588_gpio_write()
>> [BUG] gpio: gpio-adp5588: A possible sleep-in-atomic-context bug
>>                            in adp5588_gpio_direction_input()
>>
>> Reported-by: Jia-Ju Bai <baijiaju1990@gmail.com>
>> Signed-off-by: Michael Hennerich <michael.hennerich@analog.com>
> 
> Thanks Michael, excellent and prompt fix. Patch applied
> for fixes (v4.19-rcs).
> 
> Should we even tag it for stable?

Thanks, Linus - Yes that would make sense.

-- 
Greetings,
Michael

--
Analog Devices GmbH      Otl-Aicher Strasse 60-64      80807 München
Sitz der Gesellschaft München, Registergericht München HRB 40368,
Geschäftsführer: Stefan Steyerl, Thomas Edward Cribben, Eileen Wynne
