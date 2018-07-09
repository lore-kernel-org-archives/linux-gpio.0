From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Subject: Re: [PATCH] pinctrl: baytrail: Mark expected switch fall-throughs
Date: Mon, 9 Jul 2018 08:57:07 -0500
Message-ID: <91af218e-6b59-7536-44c8-cf9b510eb691@embeddedor.com>
References: <20180705155127.GA1458@embeddedor.com>
 <CACRpkdYODi2oNxqCmHtfev=NZ7S_T62B91S58kt=T84FCnnceA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACRpkdYODi2oNxqCmHtfev=NZ7S_T62B91S58kt=T84FCnnceA@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

Hi Linus,

On 07/09/2018 08:42 AM, Linus Walleij wrote:
> On Thu, Jul 5, 2018 at 5:51 PM Gustavo A. R. Silva
> <gustavo@embeddedor.com> wrote:
> 
>> In preparation to enabling -Wimplicit-fallthrough, mark switch cases
>> where we are expecting to fall through.
>>
>> Addresses-Coverity-ID: 1292308 ("Missing break in switch")
>> Addresses-Coverity-ID: 1292309 ("Missing break in switch")
> 
> I hope these special tags are accepted by the community at large.
> Has there been discussion?
> 

Yes. This is information we want to keep on the changelog:

http://lkml.iu.edu/hypermail/linux/kernel/1710.3/04013.html

>> Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
> 
> Patch applied with Mika's ACK.
> 

Thanks
--
Gustavo
