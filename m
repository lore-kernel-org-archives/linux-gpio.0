From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: Re: pinctrl/amd: Configure GPIO register using BIOS settings
Date: Thu, 28 Sep 2017 10:07:12 -0700
Message-ID: <CAKdAkRTb-aKQOOdSpx0iR0+KjdcBRz__Byyybu-QbSxLSRYVVA@mail.gmail.com>
References: <CY1PR12MB0042D650A9FCDC4B1676FB0EDCFA0@CY1PR12MB0042.namprd12.prod.outlook.com>
 <20170928065816.GA28901@dtor-ws> <DM5PR12MB1417FDCFD60A59EDEAFD336CDC790@DM5PR12MB1417.namprd12.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ua0-f169.google.com ([209.85.217.169]:51914 "EHLO
        mail-ua0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751905AbdI1RHT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 28 Sep 2017 13:07:19 -0400
Received: by mail-ua0-f169.google.com with SMTP id 72so1321328uas.8
        for <linux-gpio@vger.kernel.org>; Thu, 28 Sep 2017 10:07:18 -0700 (PDT)
In-Reply-To: <DM5PR12MB1417FDCFD60A59EDEAFD336CDC790@DM5PR12MB1417.namprd12.prod.outlook.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: "Agrawal, Nitesh-kumar" <Nitesh-kumar.Agrawal@amd.com>
Cc: "linus.walleij@linaro.org" <linus.walleij@linaro.org>, "Sen, Pankaj" <Pankaj.Sen@amd.com>, "S-k, Shyam-sundar" <Shyam-sundar.S-k@amd.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

Hi Nitesh,

On Thu, Sep 28, 2017 at 12:46 AM, Agrawal, Nitesh-kumar
<Nitesh-kumar.Agrawal@amd.com> wrote:
> -----Original Message-----
> From: Dmitry Torokhov [mailto:dmitry.torokhov@gmail.com]
> Sent: Thursday, September 28, 2017 12:28 PM
> To: Agrawal, Nitesh-kumar <Nitesh-kumar.Agrawal@amd.com>
> Cc: linus.walleij@linaro.org; Sen, Pankaj <Pankaj.Sen@amd.com>; S-k, Shyam-sundar <Shyam-sundar.S-k@amd.com>; linux-gpio@vger.kernel.org
> Subject: Re: pinctrl/amd: Configure GPIO register using BIOS settings
>
> On Fri, Sep 09, 2016 at 03:18:09PM +0000, Agrawal, Nitesh-kumar wrote:
>> In the function amd_gpio_irq_set_type, use the settings provided by
>> the BIOS,when the LevelTrig is Edge and activeLevel is HIGH, to
>> configure the GPIO registers. Ignore the settings from client.
>>
>> Reviewed-by: Pankaj Sen <Pankaj.Sen@amd.com>
>> Signed-off-by: Nitesh Kumar Agrawal <Nitesh-kumar.Agrawal@amd.com>
>
> Just found this patch in the tree. Can you please explain why it is needed (the patch description unfortunately tells what the patch does, but not why).
>
> I would expect that we either allow reprogramming the trigger as client wishes or would error out and let the upper layers know. Silently "fixing" the settings is wrong course of action in my opinion.
>
> If this was trying to work around Elan touchpad drivers not working on AMD platforms it needs to be solved in Elan driver, not here.
>
> [Nitesh]We have reverted the patch in the later version of the patch.
>

Where was it reverted? I am looking at today's linux-next, and I am
still seeing this comment in pinctrl-amd.c:

        /* Ignore the settings coming from the client and
        * read the values from the ACPI tables
        * while setting the trigger type
        */

Thanks.

-- 
Dmitry
