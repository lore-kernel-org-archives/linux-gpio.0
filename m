Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07BDBEB64DB
	for <linux-gpio@archiver.kernel.org>; Thu, 15 Jun 2023 06:39:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244121AbjFOGjV (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Thu, 15 Jun 2023 02:39:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243835AbjFOGio (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 15 Jun 2023 02:38:44 -0400
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com [IPv6:2607:f8b0:4864:20::b34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D6B026A1
        for <linux-gpio@vger.kernel.org>; Wed, 14 Jun 2023 23:38:19 -0700 (PDT)
Received: by mail-yb1-xb34.google.com with SMTP id 3f1490d57ef6-bc40d4145feso1339193276.1
        for <linux-gpio@vger.kernel.org>; Wed, 14 Jun 2023 23:38:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686811098; x=1689403098;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RN4dZI7gKG4P+u+i7PgTDiFGmRqA+JQ2PDHkjFHkniQ=;
        b=VENEmsbEHPy5l8GsWeLe2Q9EnYmn09I4/q6g/pVmXbC0YTv0qI97omWcJk+ortDlgp
         DbezUpnrTs1pjg6U1GGgQnozX3mXDGFh/GCAA09AoONXPT0k6W6Rj3Y3iQiERFL0/7SO
         qvUTEDlQ2H8m619DGeUaCuqQrT3M73x7YL2+I8aNXnEn9xXK9qkCdFrhEOpV2yt3s0Vo
         XpafVdzUySnnUWLNO8SBXFiA2y8XGl5nUaQ5pwbQ5ys+0QFRoGhdxrre17k93VaAjlyb
         LR6+k58sx0KF85FL6Na8MDFA6/bKHsw1j9qw0pKGlAUtHlCvHfdQURIeQbM3tJIT1oGZ
         PaXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686811098; x=1689403098;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RN4dZI7gKG4P+u+i7PgTDiFGmRqA+JQ2PDHkjFHkniQ=;
        b=XSQtJvMDk5sLrqJb/hhFMfHOJqpkL/nceTJrSdudLbWfhFmfEYL5uvmo1X6XDX1cVE
         kUxKK8gsFmEiDzuLKD87zpa39dM4XAbzCCuuhahmKnd+EfWuXIqQcPoYkjaUt1obshJ9
         tYm/AmSs36aKNPNOdw110gxY80XK2cQ630MEAtbLc+htDyKsaTFp5xPIYaOc7JTvWvIu
         beEzfFb2wKTBwh7XEuTvs9i6fP/3Jtlvh5IxL8FteiOFucI7H2RsREG2xa4nRvXl8Ehv
         0XbZ+9paHJ6bGB7stAzBy4LWa3ALkSJL3lfT3G5Dbhh8u4ZgKurVfOGA8lsCtF681g+/
         SikA==
X-Gm-Message-State: AC+VfDwxPYlcoXA2IHYmCz5q0TwdZPswYbaLOdLIxQ5CPGZk4lVBVg7S
        8A4NVpQ3nBIu1YCRHgUzQ3M2WXYpVpJf9yGliF5QHA==
X-Google-Smtp-Source: ACHHUZ5K0UZnEQWW7Hly0IWBgrCPksLQ7kI4IcQAAFkmDSCPLEUYOsO8XaLv3JOtIIy6xC7LMFjLMq9z7PkiugajbW8=
X-Received: by 2002:a25:80c3:0:b0:bc5:affa:fedb with SMTP id
 c3-20020a2580c3000000b00bc5affafedbmr3645121ybm.41.1686811098412; Wed, 14 Jun
 2023 23:38:18 -0700 (PDT)
MIME-Version: 1.0
References: <20230614231446.3687-1-andriy.shevchenko@linux.intel.com> <20230614231446.3687-5-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20230614231446.3687-5-andriy.shevchenko@linux.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 15 Jun 2023 08:38:07 +0200
Message-ID: <CACRpkdYXE2v+esitZoasczcij-EEBtd=50vFHHeEUWy_T4_1HQ@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] gpio: delay: Remove duplicative functionality
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Andy Shevchenko <andy@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jun 15, 2023 at 1:14=E2=80=AFAM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> Now that GPIO aggregator supports a delay line, drop the duplicative
> functionality, i.e. the entire gpio-delay driver.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

This is the most pleasing technical solution for sure.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
