From: Bjorn Andersson <bjorn@kryo.se>
Subject: Re: [PATCH 3/3] pinctrl: qcom: handle input-enable pinconf property
Date: Wed, 4 Feb 2015 09:49:33 -0800
Message-ID: <CAJAp7Oji5jgTXBRwgMTaaqFPAc7Su-h0eBBa1i40j8Kk_36JEA@mail.gmail.com>
References: <1422613644-13060-1-git-send-email-svarbanov@mm-sol.com>
	<1422613644-13060-4-git-send-email-svarbanov@mm-sol.com>
	<20150130162004.GT11960@sonymobile.com>
	<CACRpkdYsy5R60NKhDvCUuyq-oV2FnuF1GQBvyNfr0YECUXn7zw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <CACRpkdYsy5R60NKhDvCUuyq-oV2FnuF1GQBvyNfr0YECUXn7zw@mail.gmail.com>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Bjorn Andersson <bjorn.andersson@sonymobile.com>, Stanimir Varbanov <svarbanov@mm-sol.com>, "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Stephen Boyd <sboyd@codeaurora.org>
List-Id: linux-gpio@vger.kernel.org

On Wed, Feb 4, 2015 at 2:03 AM, Linus Walleij <linus.walleij@linaro.org> wrote:
> On Fri, Jan 30, 2015 at 5:20 PM, Bjorn Andersson
> <bjorn.andersson@sonymobile.com> wrote:
>> On Fri 30 Jan 02:27 PST 2015, Stanimir Varbanov wrote:
>>
>>> +     case PIN_CONFIG_INPUT_ENABLE:
>>> +             /* Pin is output */
>>> +             if (arg)
>>> +                     return -EINVAL;
>>> +             arg = 1;
>>> +             break;
>>
>> My idea of this function is to query if we have the specific option
>> enabled, so I don't like the fact that we're returning an error here, we
>> should just return 0 with arg 0 (or something like that).
>>
>> However, that would not give the results we expect and your patch is
>> "correct".
>>
>> Linus, conf_items in pinconf_generic_dump_one() seems to represent
>> boolean properties of the pins. Returning 0 from pin_config_*_get()
>> should in my view then be treated as it not being active.
>>
>> Is this in line with your view and should we modify
>> pinconf_generic_dump_one() to continue for these values if the getter
>> returns 0?
>>
>> If not, at least all the bias properties here should return -EINVAL as
>> well. (which I think is wrong)
>
> Well currently the semantics are:
>
> - ENOTSUPP = this property is not even supported
> - EINVAL       = this value exists but can not be determined
>
> It has this form primarily to serve the non-boolean properties.
> For example pull-up can return -EINVAL if pull-up is supported
> but pull-down is currently active, so it cannot say what
> resistance it is pulled up with, as it is "infinite" (NAN,
> thus translated -EINVAL).
>

That makes sense, however according to both the dt binding and
pinconf-generic e.g. pull up is a boolean property. And "input-enable"
can always be queried (at least in our case).

> It just folds over to the boolean props doing things in the
> same way to simplify things... -EINVAL just means
> "false". If we should return 1/0 from boolean props we need
> to handle them as a special case in the pinconf-generic.
> code, by extending the struct pinconf_generic_params,
> which is possible of course.
>

That's what I figured. But I would like to argue that it's not
completely intuitive.
Don't we have all the info we need already? See below.

> Further: as of now pinconf_generic_dump_one() doesn't print
> anything for inactive pulls etc return -EINVAL, but maybe
> it should? It was just handy on some system to only see
> the stuff that was really active, not to get a list of stuff that
> was not active as well.
>

That's the way it should be, so any changes to the API would need to
retain this behavior. Something like adding:

if (!pinconf_to_config_argument(config) && !conf_items[i].has_arg)
    continue;


But unless we expect any other users of this api I think we could just
leave it. I mostly wanted to clarify what the current expectations
was. Let me know if you want a patch.

Regards,
Bjorn
