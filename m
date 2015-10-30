From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH V2] pinctrl: pinconf: remove needless loop
Date: Fri, 30 Oct 2015 14:41:01 +0100
Message-ID: <CACRpkdYT3NjOm_Ax5jUAtSQVfoTnB=JxDMJk09e3-JRD7T0zPg@mail.gmail.com>
References: <1446125147-10670-1-git-send-email-laurent.meunier@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f173.google.com ([209.85.214.173]:35215 "EHLO
	mail-ob0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1030692AbbJ3NlD (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 30 Oct 2015 09:41:03 -0400
Received: by obctp1 with SMTP id tp1so43863672obc.2
        for <linux-gpio@vger.kernel.org>; Fri, 30 Oct 2015 06:41:01 -0700 (PDT)
In-Reply-To: <1446125147-10670-1-git-send-email-laurent.meunier@st.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Laurent Meunier <laurent.meunier@st.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Andriy Shevchenko <andriy.shevchenko@intel.com>

On Thu, Oct 29, 2015 at 2:25 PM, Laurent Meunier <laurent.meunier@st.com> wrote:

> This removes a needless loop which was caught in pinconf.c.
>
> Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Signed-off-by: Laurent Meunier <laurent.meunier@st.com>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Sorry this does not apply to upstream pin control "devel" branch.

Please figure out if the problem still persists and make a patch
based on that branch:
https://git.kernel.org/cgit/linux/kernel/git/linusw/linux-pinctrl.git/log/?h=devel

Yours,
Linus Walleij
