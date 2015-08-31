From: Alexandre Courbot <gnurou@gmail.com>
Subject: Re: [PATCH 2/2 v2] Documentation: gpio: board: describe the con_id parameter
Date: Mon, 31 Aug 2015 14:45:32 +0900
Message-ID: <CAAVeFuJE3Eu6NetYsbbzgLm-3_9WWFzyCcAs2OHdra+C0_F+aw@mail.gmail.com>
References: <1440926155-7183-1-git-send-email-dirk.behme@gmail.com> <1440926155-7183-2-git-send-email-dirk.behme@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f176.google.com ([209.85.214.176]:35106 "EHLO
	mail-ob0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750812AbbHaFpw (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 31 Aug 2015 01:45:52 -0400
Received: by obcbp4 with SMTP id bp4so12229626obc.2
        for <linux-gpio@vger.kernel.org>; Sun, 30 Aug 2015 22:45:52 -0700 (PDT)
In-Reply-To: <1440926155-7183-2-git-send-email-dirk.behme@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Dirk Behme <dirk.behme@gmail.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Sun, Aug 30, 2015 at 6:15 PM, Dirk Behme <dirk.behme@gmail.com> wrote:
> The con_id parameter has to match the GPIO description and is automatically
> extended by the GPIO suffix if not NULL. I had to look into the code to
> understand this and properly find the GPIO I've been looking for, so document
> this.
>
> Signed-off-by: Dirk Behme <dirk.behme@gmail.com>

Acked-by: Alexandre Courbot <acourbot@nvidia.com>

Please don't forget to include Linus W. to the v3, otherwise he may
miss your patches.
