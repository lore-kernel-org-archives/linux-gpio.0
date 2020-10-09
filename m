Return-Path: <SRS0=fgCB=DQ=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43221C433E7
	for <linux-gpio@archiver.kernel.org>; Fri,  9 Oct 2020 22:57:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CDACF22248
	for <linux-gpio@archiver.kernel.org>; Fri,  9 Oct 2020 22:57:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=kwiius.com header.i=@kwiius.com header.b="SIPs8478";
	dkim=temperror (0-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Qa8Smgd2"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731960AbgJIW5b (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Fri, 9 Oct 2020 18:57:31 -0400
Received: from wout1-smtp.messagingengine.com ([64.147.123.24]:35977 "EHLO
        wout1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1731374AbgJIW5b (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 9 Oct 2020 18:57:31 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.west.internal (Postfix) with ESMTP id 3E9BB9CD;
        Fri,  9 Oct 2020 18:57:30 -0400 (EDT)
Received: from imap22 ([10.202.2.72])
  by compute4.internal (MEProxy); Fri, 09 Oct 2020 18:57:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiius.com; h=
        mime-version:message-id:in-reply-to:references:date:from:to:cc
        :subject:content-type; s=fm3; bh=bp2eYG4YLUHguZwoiHmDTCq262GXQd0
        ebFR7tf4ZmUc=; b=SIPs8478UfgvmdJXUysI40ckygpmJEEvRUIUxzpBTPw75uu
        vNA1iHp0IFGEhaYqFEaTdsRCwz4biAiLhd/bokQ+PCK29sEDWlgAvGY1G1pQCOmG
        kKrBUqdcODTgakcSH9SNuJU5ozz1AVQh3JOK0QCsRx++42fi1TOm/F5bdDB40cFK
        KfqB3ZQATgl/TUtbXdkxvZqgQKvvQEIflX5G9ZDrCGGer7KD6axeYeu25pmh12EF
        PJGbrEunxwx5MiqykZrNTiRNCG4+oP/VUXR3uZJK3YyQiE6fFcBaHUN8x2i7H/AC
        X3LJI24SF2BjRBAw33ggLdKNPniZ0MUS2ccLj+g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=bp2eYG
        4YLUHguZwoiHmDTCq262GXQd0ebFR7tf4ZmUc=; b=Qa8Smgd20sVqu6hgiTxETG
        bR/Tr63SDLPjHUTraMNIrX8ifZvx/PlMk2HPXPZ+pRndfAOTxAL9GFqar/4FJ+70
        SO0oAHYDaO1LCwrK1cEOoGuaUwSVZN0YYzKVKKsirkWBeVsIEU83fMONK42+tceI
        Glgpaq5ihHNyLWX224zsWHzQjAznp+jYyz9DjsD6KyNAZXxdT6yweWeSzyPlyeS6
        PQ+jNRh4Pt4WadBTYdKCoykv3avT13wKPy7KLSvvxMxhwxyL1UO1PaCPniOsgOKL
        1RHn3piX8/7/nkvP3+KJ1rXiP5Z5ukGe4VxHcH8BaR9RJ+9MvgY1Dz7ZrkAkwvCg
        ==
X-ME-Sender: <xms:2eqAX9DrvriM6yjnq3PhiH50OXDS24z_Qbw6YIplIRRFV4nq8jRIlQ>
    <xme:2eqAX7hj3TxCDFV_mWJjPiyP9haiFuRk849Q3JJ5Vcv27DTGlGNtMhLRFcGsndlM4
    6uRv56Trnt0qTc42Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrhedvgddujecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvufgtsehttdertderreejnecuhfhrohhmpedflfgrmhhi
    vgcuofgtvehlhihmohhnthdfuceojhgrmhhivgeskhifihhiuhhsrdgtohhmqeenucggtf
    frrghtthgvrhhnpefgveevveduveelieeufefhvdffuefhvddutedthffhiefggedutdff
    veefiefhhfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
    hmpehjrghmihgvsehkfihiihhushdrtghomh
X-ME-Proxy: <xmx:2eqAX4kd20Zjy0q9z8dCmxYazMTKeiUWhqnThi-oZabCViUV4-tQxg>
    <xmx:2eqAX3wVBFWBboVH6MhTpSUgwDvI5sKBkBk4_R8dwhGpn16RpgQbWQ>
    <xmx:2eqAXyRSnnBGk_i4LNmkbyFinfV3x359KVhgK0a5v3NPf7Ny-FSaZw>
    <xmx:2eqAX1LUIbmFiPvK4_8Ka0jRIWvanqIgtLa3A3lqyPjN5xZTJWn9dQ>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id 5120A6680078; Fri,  9 Oct 2020 18:57:29 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.3.0-407-g461656c-fm-20201004.001-g461656c6
Mime-Version: 1.0
Message-Id: <0a6036c6-9e8a-4ec3-be3d-aaed6d2bc8f8@www.fastmail.com>
In-Reply-To: <CAHp75Vd-P56=4PibajRcdnniy2pN6ZXoUP=FiJ1enrFzxKkojg@mail.gmail.com>
References: <7102c0df-8d8b-4ef8-babf-a920ff11bcf8@www.fastmail.com>
 <CAHp75Vd-P56=4PibajRcdnniy2pN6ZXoUP=FiJ1enrFzxKkojg@mail.gmail.com>
Date:   Sat, 10 Oct 2020 11:57:08 +1300
From:   "Jamie McClymont" <jamie@kwiius.com>
To:     "Andy Shevchenko" <andy.shevchenko@gmail.com>,
        "Mika Westerberg" <mika.westerberg@linux.intel.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "Hans de Goede" <hdegoede@redhat.com>
Subject: =?UTF-8?Q?Re:_Specifying_a_valid_pullup_value_for_pinctrl=5Fintel_from_a?=
 =?UTF-8?Q?n_ACPI_table?=
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

> Hmm... Should be 0x105, otherwise 2 is an argument.
> Can you confirm it's for real 0x205?

Ah yes, you're right (I had the 2 in my head having converted it from the decimal 261)

> Fixing the driver would be the best.
> Thanks for the report, I'm on it!

Fantastic, thank you!

- Jamie
