From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] RESEND RFT: pinctrl: sirf: move sgpio lock into state container
Date: Tue, 21 Oct 2014 10:32:52 +0200
Message-ID: <CACRpkdYOyDMtoh6WaZhB9PQ9fn58zbbRsmgzB7HDw=v+UqhwHg@mail.gmail.com>
References: <1412066704-28633-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ie0-f173.google.com ([209.85.223.173]:60055 "EHLO
	mail-ie0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751331AbaJUIcw (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 21 Oct 2014 04:32:52 -0400
Received: by mail-ie0-f173.google.com with SMTP id tp5so701806ieb.32
        for <linux-gpio@vger.kernel.org>; Tue, 21 Oct 2014 01:32:52 -0700 (PDT)
In-Reply-To: <1412066704-28633-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Barry Song <Baohua.Song@csr.com>, Barry Song <baohua@kernel.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>

On Tue, Sep 30, 2014 at 10:45 AM, Linus Walleij
<linus.walleij@linaro.org> wrote:

> Instead of referring to a global static variable for the sgpio
> locking, use the state container to contain the lock.
>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> Barry, did you get around to testing this patch?

Shall I just apply this and see what happens?

Linus Walleij
