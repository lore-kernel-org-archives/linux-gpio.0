From: Alexandre Courbot <gnurou@gmail.com>
Subject: Re: [PATCH RESEND gpio] gpio-amd8111: check ioport_map return value
Date: Mon, 19 Jan 2015 16:48:00 +0900
Message-ID: <CAAVeFuLLLhxe1A=F_6ecGvgVhcrU4smWQJK_L_aW4Xj1RT9Y5w@mail.gmail.com>
References: <1420780131-6984-1-git-send-email-varkab@cdac.in>
 <CAAVeFuLC=PiG-1vHnPZLPLdxt+or6_-+MYc9H5nhVzW8sgccSQ@mail.gmail.com> <CAEUmHyZtCwe8D66uZ22z_QafnF_dZa-uKbu-rNed_aC=biZK2A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ie0-f176.google.com ([209.85.223.176]:55381 "EHLO
	mail-ie0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751356AbbASHsV (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 19 Jan 2015 02:48:21 -0500
Received: by mail-ie0-f176.google.com with SMTP id rd18so2582914iec.7
        for <linux-gpio@vger.kernel.org>; Sun, 18 Jan 2015 23:48:21 -0800 (PST)
In-Reply-To: <CAEUmHyZtCwe8D66uZ22z_QafnF_dZa-uKbu-rNed_aC=biZK2A@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Varka Bhadram <varkabhadram@gmail.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Varka Bhadram <varkab@cdac.in>

On Mon, Jan 19, 2015 at 4:04 PM, Varka Bhadram <varkabhadram@gmail.com> wrote:
> On Mon, Jan 19, 2015 at 11:57 AM, Alexandre Courbot <gnurou@gmail.com> wrote:
>> On Fri, Jan 9, 2015 at 2:08 PM, Varka Bhadram <varkabhadram@gmail.com> wrote:
>>> From: Varka Bhadram <varkabhadram@gmail.com>
>>>
>>> ioport_map() may fail. Its safe to check the return value.
>>>
>>> Signed-off-by: Varka Bhadram <varkab@cdac.in>
>>> ---
>>>  drivers/gpio/gpio-amd8111.c |    5 +++++
>>>  1 file changed, 5 insertions(+)
>>>
>>> diff --git a/drivers/gpio/gpio-amd8111.c b/drivers/gpio/gpio-amd8111.c
>>> index d3d2d10..2c4d9ab 100644
>>> --- a/drivers/gpio/gpio-amd8111.c
>>> +++ b/drivers/gpio/gpio-amd8111.c
>>> @@ -213,6 +213,11 @@ found:
>>>                 goto out;
>>>         }
>>>         gp.pm = ioport_map(gp.pmbase + PMBASE_OFFSET, PMBASE_SIZE);
>>> +       if (!gp.pm) {
>>> +               dev_err(&pdev->dev, "Couldn't map io port into io memory\n");
>>> +               err = -ENOMEM;
>>> +               goto out;
>>
>> You are not calling release_region() to free the region requested right above.
>
> Yes... You are correct. I will send the patch for this. Can i add
> Reported-by tag of your..?

Ah, I did not notice that Linus had already merged this. Sure, feel
free to do so.
