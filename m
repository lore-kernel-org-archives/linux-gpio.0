From: Ramon Fried <ramon.fried@linux.intel.com>
Subject: Re: pinctrl: -EAGAIN not supported but documented
Date: Mon, 21 Jan 2019 16:27:57 +0200
Message-ID: <81fc986c-10b1-d1b1-9f60-241ec2abd446@linux.intel.com>
References: <94b9acab-a739-a014-b068-768f40de38ec@linux.intel.com>
 <CACRpkdYPBf6sYzbk1W-znYxaaaGvvO=tT_rXt7SXBwDRa6fJ1w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACRpkdYPBf6sYzbk1W-znYxaaaGvvO=tT_rXt7SXBwDRa6fJ1w@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org


On 1/21/19 4:26 PM, Linus Walleij wrote:
> On Mon, Jan 21, 2019 at 2:28 PM Ramon Fried <ramon.fried@linux.intel.com> wrote:
>
>> Stated in Documentation/driver-api/pinctl.rst:
>>
>> Since some controllers have special logic for handling entire groups of pins
>> they can exploit the special whole-group pin control function. The
>> pin_config_group_set() callback is allowed to return the error code -EAGAIN,
>> for groups it does not want to handle, or if it just wants to do some
>> group-level handling and then fall through to iterate over all pins, in
>> which
>> case each individual pin will be treated by separate pin_config_set()
>> calls as
>> well.
>>
>> ----
>>
>> This is not supported, and there's no code for handling it.
>>
>> Should we add the necessary code or just remove the wrong documentation.
> The idea was removed in:
> commit ad42fc6c84795d19972e7f7dee70fe74bec4c2d8
> "pinctrl: rip out the direct pinconf API"
>
> I think we should just remove the documentation.
>
> Do you want me to look into it or do you want to send a patch?
>
> Yours,
> Linus Walleij

I'll send a patch shortly.

Thanks.

Ramon.
