From: Laura Abbott <labbott@redhat.com>
Subject: Re: [PATCHv8] gpio: Remove VLA from gpiolib
Date: Mon, 21 May 2018 10:30:55 -0700
Message-ID: <fc2fb457-57eb-d929-1061-5bc00ee218a8@redhat.com>
References: <20180518175304.20414-1-labbott@redhat.com>
 <CAHp75VciKgqYV_DB=h+zaVkk2+dmKJDhT02M4K8T1VGJA6KM0g@mail.gmail.com>
 <CAMuHMdX878Vun9oCrECA+uW-ErEgzRx8Gp2wLkoLdKXR0nNKAw@mail.gmail.com>
 <CAHp75VezhMm9R64y2A6mobQVqbLMLUKtzxQHp7uRDTBTMMzpRw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <kernel-hardening-return-13336-glkh-kernel-hardening=m.gmane.org@lists.openwall.com>
List-Post: <mailto:kernel-hardening@lists.openwall.com>
List-Help: <mailto:kernel-hardening-help@lists.openwall.com>
List-Unsubscribe: <mailto:kernel-hardening-unsubscribe@lists.openwall.com>
List-Subscribe: <mailto:kernel-hardening-subscribe@lists.openwall.com>
In-Reply-To: <CAHp75VezhMm9R64y2A6mobQVqbLMLUKtzxQHp7uRDTBTMMzpRw@mail.gmail.com>
Content-Language: en-US
To: Andy Shevchenko <andy.shevchenko@gmail.com>, Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Kees Cook <keescook@chromium.org>, Lukas Wunner <lukas@wunner.de>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, kernel-hardening@lists.openwall.com, Phil Reid <preid@electromag.com.au>
List-Id: linux-gpio@vger.kernel.org

On 05/18/2018 02:12 PM, Andy Shevchenko wrote:
> On Sat, May 19, 2018 at 12:05 AM, Geert Uytterhoeven
> <geert@linux-m68k.org> wrote:
>> On Fri, May 18, 2018 at 10:07 PM, Andy Shevchenko
>> <andy.shevchenko@gmail.com> wrote:
>>> On Fri, May 18, 2018 at 8:53 PM, Laura Abbott <labbott@redhat.com> wrote:
> 
>>>> +               bits = mask + BITS_TO_LONGS(chip->ngpio);
>>>> +               memset(mask, 0, BITS_TO_LONGS(chip->ngpio) * sizeof(*mask));
>>>
>>> Wouldn't be better
>>>
>>> bitmap_zero(mask, chip->ngpio);
>>>
>>> ?
>>
>> chip->ngpio is never const, so bitmap_zero() would always fall back to
>> plain memset().
> 
> Yes. But it also much more readable and understandable here.
> 

I wasn't aware of that API. I'll switch to that.
