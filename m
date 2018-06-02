From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Subject: Re: [PATCH] staging: mt7621-gpio: move out of staging
Date: Sat, 2 Jun 2018 09:33:04 +0200
Message-ID: <CAMhs-H_3W8Tue7qvywA6RzvwS87Cu+MjrW7CYS9Kb1fD3dgSBw@mail.gmail.com>
References: <1527854570-17200-1-git-send-email-sergio.paracuellos@gmail.com>
 <20180601181347.GA27486@kroah.com>
 <CAMhs-H_u1q7pfTRrU34p0HjxQeAMGPv54EnFBLFbKQLajDw21g@mail.gmail.com>
 <87efhqrsp0.fsf@notabene.neil.brown.name>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <87efhqrsp0.fsf@notabene.neil.brown.name>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: NeilBrown <neil@brown.name>
Cc: Greg KH <gregkh@linuxfoundation.org>, Linus Walleij <linus.walleij@linaro.org>, driverdev-devel@linuxdriverproject.org, linux-gpio@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

On Sat, Jun 2, 2018 at 1:30 AM, NeilBrown <neil@brown.name> wrote:
> On Fri, Jun 01 2018, Sergio Paracuellos wrote:
>
>>> I suggest you submit this as a new driver to the gpio maintainer and
>>> developers and then if/when it is merged into that tree, we can then
>>> delete the staging tree version.  That makes it easier for the gpio
>>> developers to review it and makes any cross-tree merge issues go away.
>>
>> I see. Ok, I'll send this in the way you are pointing out here
>> hopefully tomorrow morning :-)
>
> When you do, please also Cc maintainers for
>   OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS
> to get review for the new .dts file, though get-maintainers will
> probably recommend that once you have a proper patch.
> Also it would be good to highlight any uncertainties we might have
> to get review comments specifically on those.
> Specifically we should mention that
>
>   The functionality is presented as a single irq-chip but 3 separate
>   gpio-chips, as this seemed simplest.  Is this acceptable, or does it
>   need to be changed?
>
> Please add my Reviewed-by: NeilBrown <neil@brown.name> to the patch when
> you send it.

Thanks for advices.

I have just sent it as you were pointing out here.

>
> Thanks,
> NeilBrown
>

Best regards,
    Sergio Paracuellos
