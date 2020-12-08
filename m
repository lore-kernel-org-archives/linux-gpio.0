Return-Path: <linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9B59C433FE
	for <linux-gpio@archiver.kernel.org>; Tue,  8 Dec 2020 10:33:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 941E923A9D
	for <linux-gpio@archiver.kernel.org>; Tue,  8 Dec 2020 10:33:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728837AbgLHKcx (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Tue, 8 Dec 2020 05:32:53 -0500
Received: from mout.kundenserver.de ([217.72.192.73]:59215 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726138AbgLHKcx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 8 Dec 2020 05:32:53 -0500
Received: from [192.168.1.155] ([95.117.39.192]) by mrelayeu.kundenserver.de
 (mreue109 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1MVNEv-1kbp1u13Yd-00SP64 for <linux-gpio@vger.kernel.org>; Tue, 08 Dec 2020
 11:30:21 +0100
To:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
From:   "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Subject: RFC: introduce typedef for gpio numbers (driver side) ?
Message-ID: <8cf39bb5-f264-0262-dd5b-f70489942f16@metux.net>
Date:   Tue, 8 Dec 2020 11:30:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: tl
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:Ug52rZjKyft9DEou+2j2ARqkj7Y+LQ0dl6/v/ZMZsr5OIWCGKt+
 2IkxsGnZOJTZoofC9Qy+nrqj0bJwbU74vKCXmjgbgRt3NJJf8K0QHFqWsFnXjW16tLMnwJh
 3jUO2XtCPBI5dOY06OQhx4pyF0/SHCL4+sClwH9pqwCP0zvDNA2+jGZC67leH8Tgd3Y+vB/
 CL7nA+MvwCI25gIk9ijUQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:oLvVDVWqUHQ=:VGthlEup/YneQPWFyvEfdB
 Mj/GnBEKC7WXUut7wcqbc7PST+0ZHI62FDU2IRzIcNHlOpEwrLAQ08eAshdqZP+jJll3BxV90
 2pvFsqD2phvrVi59c/pQBFmtwT0acs/xdtOZvKB4se24ATvC0wV3Jw5FIdyZ0H3E7PjGK6N8T
 knr3y4pl56t2PvA9KxFfTxVfeY9GzmIlo8TpNL6HJ9A8oOIhYwJ7P9WMpoxrXFJWi24Rcw6vA
 AVrQEWnghltjdf7f9Y/8aF6lFgjtlWyb03swfyfml9va2J8lRAeXAK01xlDvYAJQyCeBGkUms
 xF6yZeyXelw1XwHN6POECFLCEZKdacWn4xpw7ec9QRFhqKz/2+xvE/4xqRPR4oajgdIcYZgYC
 y760b1KVRxJFzSZ4/VYOLGtyrRrcZSLp1StZxfFXqVh/x3iPKmlWAoXj+jJIb
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi folks,


just a weird idea: shall we introduce a typedef for the gpio id's
(on driver side), instead of directly using 'unsigned int' ?

Somehow looks nicer to me ...


--mtx

-- 
---
Hinweis: unverschlüsselte E-Mails können leicht abgehört und manipuliert
werden ! Für eine vertrauliche Kommunikation senden Sie bitte ihren
GPG/PGP-Schlüssel zu.
---
Enrico Weigelt, metux IT consult
Free software and Linux embedded engineering
info@metux.net -- +49-151-27565287
