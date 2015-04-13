From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH] pinctrl: bcm2835: Fix support for threaded level triggered
 IRQs
Date: Sun, 12 Apr 2015 21:48:04 -0600
Message-ID: <552B3C74.9030004@wwwdotorg.org>
References: <1428403425-12058-1-git-send-email-ckeepax@opensource.wolfsonmicro.com> <CACRpkdbRmWUYv_2cy8NebpRm5tHZJD-LiximUJ-teJb8y3hrCg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACRpkdbRmWUYv_2cy8NebpRm5tHZJD-LiximUJ-teJb8y3hrCg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>, Ray Jui <rjui@broadcom.com>, Lee Jones <lee@kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, linux-rpi-kernel@lists.infradead.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On 04/08/2015 08:43 AM, Linus Walleij wrote:
> On Tue, Apr 7, 2015 at 12:43 PM, Charles Keepax
> <ckeepax@opensource.wolfsonmicro.com> wrote:
> 
>> Currently, the driver uses handle_simple_irq for all IRQ types and hard
>> codes the acknowledge for different IRQ types into the handler. It is
>> better to use the IRQ core as intended and let it handle the differences
>> between the various types of IRQ. For example the current system does
>> not work for threaded level triggered IRQs as these need to be masked
>> until the threaded handler has run.
>>
>> Signed-off-by: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
> 
> Looks like a very fine patch so applied unless Stephen has
> some problem with it.

This patch sounds plausible to me:-)
