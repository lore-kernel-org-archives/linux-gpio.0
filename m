From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: Re: [PATCH] gpio: thunderx: remove unused .map() hook from irq_domain_ops
Date: Sun, 8 Oct 2017 22:39:42 +0900
Message-ID: <CAK7LNATor59dKq37wEKD3bqcxekEk5WPo-uZ1eBFwW5NJWTUMA@mail.gmail.com>
References: <1505356645-19765-1-git-send-email-yamada.masahiro@socionext.com> <26ac3165-c512-0b79-da17-0232634a5aba@caviumnetworks.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <26ac3165-c512-0b79-da17-0232634a5aba@caviumnetworks.com>
Sender: linux-kernel-owner@vger.kernel.org
To: David Daney <ddaney@caviumnetworks.com>
Cc: linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, David Daney <david.daney@cavium.com>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

2017-09-22 6:54 GMT+09:00 David Daney <ddaney@caviumnetworks.com>:
> On 09/13/2017 07:37 PM, Masahiro Yamada wrote:
>>
>> This driver implements .alloc() hook, so .map() is not used.
>
>
> Although this comment is true for this driver, it is unclear to me if the
> statement is true in the general case.

If a driver implements .alloc() hook,
irq_domain_check_hierarchy() sets IRQ_DOMAIN_FLAG_HIERARCHY flag.


If you see kernel/irq/irqdomain.c,
alloc/map is selected by irq_domain_is_hierarchy().



-- 
Best Regards
Masahiro Yamada
