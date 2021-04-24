Return-Path: <linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A63E4C433ED
	for <linux-gpio@archiver.kernel.org>; Sat, 24 Apr 2021 11:22:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 766756146B
	for <linux-gpio@archiver.kernel.org>; Sat, 24 Apr 2021 11:22:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231836AbhDXLXP (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Sat, 24 Apr 2021 07:23:15 -0400
Received: from out28-99.mail.aliyun.com ([115.124.28.99]:45245 "EHLO
        out28-99.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229630AbhDXLXP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 24 Apr 2021 07:23:15 -0400
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.1138952|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_enroll_verification|0.00821303-0.00137538-0.990412;FP=0|0|0|0|0|-1|-1|-1;HT=ay29a033018047193;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=14;RT=14;SR=0;TI=SMTPD_---.K3KkmOM_1619263351;
Received: from 192.168.88.128(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.K3KkmOM_1619263351)
          by smtp.aliyun-inc.com(10.147.43.230);
          Sat, 24 Apr 2021 19:22:32 +0800
Subject: Re: [PATCH v6 00/12] Fix bugs and add support for new Ingenic SoCs.
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Paul Cercueil <paul@crapouillou.net>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-mips@vger.kernel.org,
        linux-kernel <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "Dr. H. Nikolaus Schaller" <hns@goldelico.com>, paul@boddie.org.uk,
        andy.shevchenko@gmail.com, dongsheng.qiu@ingenic.com,
        aric.pzqi@ingenic.com, rick.tyliu@ingenic.com,
        sernia.zhou@foxmail.com
References: <1618757073-1724-1-git-send-email-zhouyanjie@wanyeetech.com>
 <CACRpkdY348FQM0TUqmczV96j29WvX4p6QUWajN34N=YF98aLBQ@mail.gmail.com>
From:   Zhou Yanjie <zhouyanjie@wanyeetech.com>
Message-ID: <664d8b46-02fd-fca5-e454-968c72ce81a9@wanyeetech.com>
Date:   Sat, 24 Apr 2021 19:22:31 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CACRpkdY348FQM0TUqmczV96j29WvX4p6QUWajN34N=YF98aLBQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linus,

On 2021/4/22 上午7:16, Linus Walleij wrote:
> On Sun, Apr 18, 2021 at 4:44 PM 周琰杰 (Zhou Yanjie)
> <zhouyanjie@wanyeetech.com> wrote:
>
>> v5->v6:
>> 1.Add the missing lcd-24bit group.
>> 2.Add DMIC pins support for Ingenic SoCs.
>> 3.Adjust and simplify the code.
> This v6 patch set applied!
>
> Thanks a lot for your hard work on this Zhou!


Thank you! It's my honor!


Best regards!


>
> Yours,
> Linus Walleij
