From: Sekhar Nori <nsekhar-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH 0/2] DaVinci: GPIO: fixes
Date: Tue, 12 Nov 2013 11:48:33 +0530
Message-ID: <5281C839.8070100@ti.com>
References: <1383893156-28010-1-git-send-email-prabhakar.csengg@gmail.com>
	<5280FB19.4020204@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <davinci-linux-open-source-bounces+gld-davinci-linux-open-source=gmane.org-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org>
In-Reply-To: <5280FB19.4020204-l0cyMroinI0@public.gmane.org>
List-Unsubscribe: <http://linux.davincidsp.com/mailman/options/davinci-linux-open-source>,
	<mailto:davinci-linux-open-source-request-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org?subject=unsubscribe>
List-Archive: <http://linux.davincidsp.com/pipermail/davinci-linux-open-source>
List-Post: <mailto:davinci-linux-open-source-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org>
List-Help: <mailto:davinci-linux-open-source-request-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org?subject=help>
List-Subscribe: <http://linux.davincidsp.com/mailman/listinfo/davinci-linux-open-source>,
	<mailto:davinci-linux-open-source-request-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org?subject=subscribe>
Sender: <davinci-linux-open-source-bounces+gld-davinci-linux-open-source=gmane.org-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org>
Errors-To: davinci-linux-open-source-bounces+gld-davinci-linux-open-source=gmane.org-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org
To: Grygorii Strashko <grygorii.strashko-l0cyMroinI0@public.gmane.org>, Prabhakar Lad <prabhakar.csengg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, DLOS <davinci-linux-open-source-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org>, LAK <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-gpio@vger.kernel.org

On Monday 11 November 2013 09:13 PM, Grygorii Strashko wrote:
> Hi Sekhar, Prabhakar Lad
> 
> On 11/08/2013 08:45 AM, Prabhakar Lad wrote:> From: "Lad, Prabhakar" <prabhakar.csengg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>>
>> This patch series fixes gpio driver regestration
>> and offset check for unbanked gpio.
>>
>> Lad, Prabhakar (2):
>>    gpio: davinci: Fix a check for unbanked gpio
>>    ARM: davinci: Fix number of resources passed to
>>      davinci_gpio_register() call
> 
> I've verified both patches - looks ok. 
> Patch 1 - restores unbanked GPIO IRQs functionality
> Patch 2 - allows to register GPIO Platform devices and boot without issues.
> 
> Could we move forward with these patches?

Prabhakar, both patches look good to me. Thanks for the fixes.

Also Grygorii, have you actually verified that the unbanked IRQ support
works? Only DM365 uses it.

What do I add for you? Tested-by: or Acked-by:

Thanks,
Sekhar
