From: shuah <shuah@kernel.org>
Subject: Re: [PATCH] selftests: gpio: Find libmount with pkg-config if
 available
Date: Wed, 5 Dec 2018 16:21:30 -0700
Message-ID: <6dc6f709-6940-4f63-c8d0-9cbbbd39ac2a@kernel.org>
References: <20181016214659.22362-1-daniel.diaz@linaro.org>
 <CACRpkda1i_NDnBGgrEoY2ewdSvSnJFVLWWvmSGCu0sNS0hLyiQ@mail.gmail.com>
 <CADYN=9LEVUgz_ou6kWrXZGBpUZ5Ti7BB+0Uxp1NtP18BJDVHCg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CADYN=9LEVUgz_ou6kWrXZGBpUZ5Ti7BB+0Uxp1NtP18BJDVHCg@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Anders Roxell <anders.roxell@linaro.org>, Linus Walleij <linus.walleij@linaro.org>
Cc: =?UTF-8?Q?Daniel_D=c3=adaz?= <daniel.diaz@linaro.org>, "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, Bamvor Zhang <bamv2005@gmail.com>, brgl@bgdev.pl, linux-gpio@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, shuah <shuah@kernel.org>
List-Id: linux-gpio@vger.kernel.org

On 12/5/18 4:15 PM, Anders Roxell wrote:
> On Wed, 5 Dec 2018 at 22:50, Linus Walleij <linus.walleij@linaro.org> wrote:
>>
>> Sorry for top-posting,
>>
>> I don't understand the selftest environment very well so I do not know
>> if this is the right thing to do.
>>
>> I can merge the patch through the GPIO tree but I need a nod from
>> someone wise, like Shuah Khan or Anders Roxell (Anders has been
>> using the GPIO selftests) that this is the direction we want to go.
> 
> Yes this makes sense and its already in linux-next.
> 

Linus,

Great. I pulled this in last week into kselftest next for 4.21-rc1 
thinking that this is a good direction.

thanks,
-- Shuah
