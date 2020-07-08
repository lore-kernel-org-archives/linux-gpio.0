Return-Path: <SRS0=2f2S=AT=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D7E4C433DF
	for <linux-gpio@archiver.kernel.org>; Wed,  8 Jul 2020 11:38:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1F8AE2067D
	for <linux-gpio@archiver.kernel.org>; Wed,  8 Jul 2020 11:38:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1594208339;
	bh=Dz15qywcmQ+ruiTxaEqdW7Qb9bpcshqiEWid/X0ZM2I=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To:List-ID:From;
	b=IqaxZ1tJCua3D+C5+26B0NOk8mCAYKaxlLSrrsWRt7OD2qL1RvdI6nXrY8En5PWDx
	 f33DiR+aA39uZVpNTPuyCODFIYPIjFH9koOaxVrgd55MAvfryHdZQghgkRhp7FnAiO
	 ZcdpLH7hA1w30MG9gOJMhhCvQgJ3p4VFhXQzXCSU=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728739AbgGHLi6 (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Wed, 8 Jul 2020 07:38:58 -0400
Received: from mail-ed1-f45.google.com ([209.85.208.45]:37528 "EHLO
        mail-ed1-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728592AbgGHLi6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 8 Jul 2020 07:38:58 -0400
Received: by mail-ed1-f45.google.com with SMTP id g20so41251408edm.4
        for <linux-gpio@vger.kernel.org>; Wed, 08 Jul 2020 04:38:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=kfP3An9VPFb1Xsn2CC1IksrkMR06ye0kMTWhwy41kCg=;
        b=ED3+p0p5nIKyrhwXZDmT7QPsQzEL3oNnx+f+Szt/6ZF2yOLchlQ5gA6JG1lf44DWS8
         KRKcPQ+EqHE9WlO9+/2Uloyet76/T15PryZlbjEzaJFHbjaKIFDGWmGaIo5N7RkiFSTH
         zUZNeetqm4iJAKrZCOPafE/VGw8BjMRjlLDnjJt2L6g7bFEgiD8ZF33uHibMihqBG01P
         5SgxGa5pBiCypvWJN1WKyWaGo5dkAfYCtvlRlj3dNezMsGCmfClnvgPGLoJHur6ZKCUE
         rj28r46/fwCvhNGs3YKZd3T+MlKKRZw47UTdHQVXn10uwlbRYwTRKMMVjOiPJOwtuPBl
         M/IA==
X-Gm-Message-State: AOAM532KALTuyULZZv2bdH1zGanwsGgpOqcIHcO8PniEACq7Rd3Dk4kU
        lpmek+Y2kOVL/s0rCWwzUvA=
X-Google-Smtp-Source: ABdhPJyhPFscEWjgde2huVw2193pJ1BEY9dJinU5XeT/8vBpVK+Uf8EhF80TXHUj+FTWp7VA1UzmhA==
X-Received: by 2002:a50:afe1:: with SMTP id h88mr66348349edd.295.1594208336718;
        Wed, 08 Jul 2020 04:38:56 -0700 (PDT)
Received: from ?IPv6:2a0b:e7c0:0:107::70f? ([2a0b:e7c0:0:107::70f])
        by smtp.gmail.com with ESMTPSA id p9sm1857958ejd.50.2020.07.08.04.38.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jul 2020 04:38:56 -0700 (PDT)
Subject: Re: chv-gpio interrupt storm on UMAX VisionBook 10Wi Pro
To:     Hans de Goede <hdegoede@redhat.com>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>
References: <5ed9d3ad-743f-e139-cf20-18eb418b24cd@kernel.org>
 <CACRpkdbWYhbtR+Tv5fFdxuyPAXU68uAswFYNZQfNFaR_89k=nw@mail.gmail.com>
 <9781e07e-a609-a2e1-112f-e5ebc78bfc23@redhat.com>
 <77bc7754-9a51-ed8f-5f88-3ed9f8ecca81@kernel.org>
 <2d5c5968-ad66-cbbc-a754-8f6114ff0ded@redhat.com>
 <ce01fc0d-e71a-26c9-1168-16926198fdef@kernel.org>
 <7af963cb-4994-d4ea-1172-de7fd5db2f4a@redhat.com>
From:   Jiri Slaby <jirislaby@kernel.org>
Message-ID: <88c29873-ff4e-b9c0-d102-a2c35726eddb@kernel.org>
Date:   Wed, 8 Jul 2020 13:38:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <7af963cb-4994-d4ea-1172-de7fd5db2f4a@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 08. 07. 20, 13:30, Hans de Goede wrote:
>>> So what we see here is that the "Android" style INTCFD9 device has
>>> an extra entry for the home-button and I guess (hard to see on the
>>> pictures) that there is no physical home-button.
>>
>> I don't know what it should look like, but there is no button with
>> house-like painting. There is only a standard "Home" button -- Fn+PgUp.
>> And that works even without that module.
> 
> I just realized I did not reply to this bit. I meant a home button on
> the tablet part of the 2-in-1, so next to the power and volume buttons
> on the tablet's edge.

Nope, there is only (volume) +, -, and ⏻.

thanks,
-- 
js
