From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 3/3] pinctrl: qcom: handle input-enable pinconf property
Date: Wed, 4 Feb 2015 11:03:36 +0100
Message-ID: <CACRpkdYsy5R60NKhDvCUuyq-oV2FnuF1GQBvyNfr0YECUXn7zw@mail.gmail.com>
References: <1422613644-13060-1-git-send-email-svarbanov@mm-sol.com>
	<1422613644-13060-4-git-send-email-svarbanov@mm-sol.com>
	<20150130162004.GT11960@sonymobile.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f176.google.com ([209.85.214.176]:32820 "EHLO
	mail-ob0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933365AbbBDKDh (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 4 Feb 2015 05:03:37 -0500
Received: by mail-ob0-f176.google.com with SMTP id wo20so534244obc.7
        for <linux-gpio@vger.kernel.org>; Wed, 04 Feb 2015 02:03:36 -0800 (PST)
In-Reply-To: <20150130162004.GT11960@sonymobile.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@sonymobile.com>
Cc: Stanimir Varbanov <svarbanov@mm-sol.com>, "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Stephen Boyd <sboyd@codeaurora.org>

On Fri, Jan 30, 2015 at 5:20 PM, Bjorn Andersson
<bjorn.andersson@sonymobile.com> wrote:
> On Fri 30 Jan 02:27 PST 2015, Stanimir Varbanov wrote:
>
>> +     case PIN_CONFIG_INPUT_ENABLE:
>> +             /* Pin is output */
>> +             if (arg)
>> +                     return -EINVAL;
>> +             arg = 1;
>> +             break;
>
> My idea of this function is to query if we have the specific option
> enabled, so I don't like the fact that we're returning an error here, we
> should just return 0 with arg 0 (or something like that).
>
> However, that would not give the results we expect and your patch is
> "correct".
>
> Linus, conf_items in pinconf_generic_dump_one() seems to represent
> boolean properties of the pins. Returning 0 from pin_config_*_get()
> should in my view then be treated as it not being active.
>
> Is this in line with your view and should we modify
> pinconf_generic_dump_one() to continue for these values if the getter
> returns 0?
>
> If not, at least all the bias properties here should return -EINVAL as
> well. (which I think is wrong)

Well currently the semantics are:

- ENOTSUPP = this property is not even supported
- EINVAL       = this value exists but can not be determined

It has this form primarily to serve the non-boolean properties.
For example pull-up can return -EINVAL if pull-up is supported
but pull-down is currently active, so it cannot say what
resistance it is pulled up with, as it is "infinite" (NAN,
thus translated -EINVAL).

It just folds over to the boolean props doing things in the
same way to simplify things... -EINVAL just means
"false". If we should return 1/0 from boolean props we need
to handle them as a special case in the pinconf-generic.
code, by extending the struct pinconf_generic_params,
which is possible of course.

Further: as of now pinconf_generic_dump_one() doesn't print
anything for inactive pulls etc return -EINVAL, but maybe
it should? It was just handy on some system to only see
the stuff that was really active, not to get a list of stuff that
was not active as well.

Yours,
Linus Walleij
