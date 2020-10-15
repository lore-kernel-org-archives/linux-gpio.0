Return-Path: <SRS0=i6KD=DW=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F01FC433DF
	for <linux-gpio@archiver.kernel.org>; Thu, 15 Oct 2020 08:44:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DA59520760
	for <linux-gpio@archiver.kernel.org>; Thu, 15 Oct 2020 08:44:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=intenta.de header.i=@intenta.de header.b="TynQbSLI"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388226AbgJOIoC (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Thu, 15 Oct 2020 04:44:02 -0400
Received: from mail.intenta.de ([178.249.25.132]:29992 "EHLO mail.intenta.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387734AbgJOIoC (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 15 Oct 2020 04:44:02 -0400
X-Greylist: delayed 351 seconds by postgrey-1.27 at vger.kernel.org; Thu, 15 Oct 2020 04:44:01 EDT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=intenta.de; s=dkim1;
        h=Content-Type:MIME-Version:Message-ID:Subject:To:From:Date; bh=GLYDIFBYcG4RMSQogoCjofEnXIDJWQ5Ge3qIeZInCH8=;
        b=TynQbSLIiP0/mHMrMN8icBwz9U3DPMse17/c0qrG4s2l6KYJOMci7O7lDz06Usaxgkbd0jGAZRTTbP480BYTTQN1rC3oG7gBy3w1MlvfYjTJdtaQz3/51IeGQOi+ge8fZH7LDm5hb3iQGPYhDvahkuNGJS8jTWenqvEdfA2xKk3nhVBXz+W9iByFC03Js356OOLoiAwuq4BA02Ij+KhUlUuBe3+R7C9ZMw4VgARyq9p88dmtAHUeTkMAf9GhlEhEiO2LBTx1N7UL9P3IaDoqKzZNu0lT+14p0sHcfwOMYia6qHL5WnzcbbpN5v6NRh9/vN1tZtHH3tWAmuBsucX8fw==;
Date:   Thu, 15 Oct 2020 10:38:06 +0200
From:   Helmut Grohne <helmut.grohne@intenta.de>
To:     <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bartekgola@gmail.com>
Subject: [libgpiod] cxx bindings: time_point vs duration
Message-ID: <20201015083805.GA10354@laureti-dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: ICSMA002.intenta.de (10.10.16.48) To ICSMA002.intenta.de
 (10.10.16.48)
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

I was trying to use the C++ bindings of libgpiod and wondered about
this.

| struct line_event {
| 	...
| 	::std::chrono::nanoseconds timestamp;
| 	...
| };

std::chrono::nanoseconds is a duration, an interval of time. The member
is called timestamp. It is documented as an estimate of the time point
when the event actually happened. It seems to me that conceptually
std::chrono::time_point would have type of choice here. What was the
reason for not using it?

Helmut
