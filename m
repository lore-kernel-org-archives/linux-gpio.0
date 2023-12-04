Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XykgohPd"
Received: from mail-yw1-x112f.google.com (mail-yw1-x112f.google.com [IPv6:2607:f8b0:4864:20::112f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 550C4DF
	for <linux-gpio@vger.kernel.org>; Mon,  4 Dec 2023 06:47:11 -0800 (PST)
Received: by mail-yw1-x112f.google.com with SMTP id 00721157ae682-5b383b4184fso48934707b3.1
        for <linux-gpio@vger.kernel.org>; Mon, 04 Dec 2023 06:47:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701701230; x=1702306030; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0vucZ1p7lmrLTgOrAv8yDP9iwaoHQ9uGpar2Z2YYKFs=;
        b=XykgohPdN98MPrT/aD9Ahw5v0XrZDQ7GI7RiABqMLJkVH/MQCevD2rLKCn+qXQOd31
         /cAwXMSz5bYdysMRt5mMgl8xlkgUwLJlmKxW2pjhPmyuyIF8C2SLoT5rq6tZeaa/oSPz
         znKAlVGGL2Bs6/Z1b44FUQk5KL6JQHZWrZX35Oe6EDqLBAG6iLMguwUQNal76ZyiYU2G
         fzyj/PphdO7Y9vnxlg+HWN+W0S6qXb6pMPt4t36Lj5CoK/X8e3sAM47DjCHmM+gl9Yef
         yvQyZFcqTjIUqiRxWaTOheY9XPjBF762VsejWsporr2baORywN7BKgLZSVnGkp84EYxH
         iYvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701701230; x=1702306030;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0vucZ1p7lmrLTgOrAv8yDP9iwaoHQ9uGpar2Z2YYKFs=;
        b=MUdc2Q5mLFfl+LEEBRl8z8sA5cq371pK7vfmfjYXbyr2jI4W1rS+jdAkOnYZl+i64R
         7ToWf9X8BcEXoLXWs5EG7FbIZXALNPfsLOnV5IDX25UEjMcng3hGOO0qVJCfsMEhSxyD
         AUeei0D7ZQHVX1wR31vbFHwEFBYSRdH1sEGX9nkOnV1KzhuZm50U3wroNo+0v2PmSjEE
         1hJzEMo0oszDTE4wCevPFRkvpsdL5y7Sfpm6IPLSM85EkyCnDvYJqyIi/qAwadSFa1ul
         f1DW4V7tTRX8xWjNyGczL/hrnyfcCQdaCJuqnrzDBeHTdmPghSssTE330Ishq+n6hr9t
         iAyA==
X-Gm-Message-State: AOJu0YxEAM3Gqx3tdOrVywXRaySyt0Iyy+OvW3Kh7H9JRj/NzfORPqfg
	60r3kX+bUwY9o4gf9MUH/RFl8dBubjWKwBCARbHGGA==
X-Google-Smtp-Source: AGHT+IHgXzWviSQW2d1SePNsoxk1BKBmHjrLPdI55ANyIj7rDYII0ZG16RM7of32E1ktEFD6/FELQXGdGyRD9bzJrGU=
X-Received: by 2002:a81:4426:0:b0:5d3:7ee5:d0db with SMTP id
 r38-20020a814426000000b005d37ee5d0dbmr2558189ywa.20.1701701230569; Mon, 04
 Dec 2023 06:47:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231203032431.30277-1-mario.limonciello@amd.com> <20231203032431.30277-3-mario.limonciello@amd.com>
In-Reply-To: <20231203032431.30277-3-mario.limonciello@amd.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 4 Dec 2023 15:46:59 +0100
Message-ID: <CACRpkdZQ+q3meJkGc2j8QQhHtpdK6g69C5MVfXrqY4xy3bct1A@mail.gmail.com>
Subject: Re: [PATCH 2/2] pinctrl: amd: Mask non-wake source pins with
 interrupt enabled at suspend
To: Mario Limonciello <mario.limonciello@amd.com>
Cc: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <benjamin.tissoires@redhat.com>, 
	"open list:PIN CONTROL SUBSYSTEM" <linux-gpio@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	Basavaraj Natikar <Basavaraj.Natikar@amd.com>, 
	"open list:HID CORE LAYER" <linux-input@vger.kernel.org>, Marcus Aram <marcus+oss@oxar.nl>, 
	Mark Herbert <mark.herbert42@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Dec 3, 2023 at 4:25=E2=80=AFAM Mario Limonciello
<mario.limonciello@amd.com> wrote:

> If a pin isn't marked as a wake source processing any interrupts is
> just going to destroy battery life.  The APU may wake up from a hardware
> sleep state to process the interrupt but not return control to the OS.
>
> Mask interrupt for all non-wake source pins at suspend. They'll be
> re-enabled at resume.
>
> Reported-and-tested-by: Marcus Aram <marcus+oss@oxar.nl>
> Reported-and-tested-by: Mark Herbert <mark.herbert42@gmail.com>
> Link: https://gitlab.freedesktop.org/drm/amd/-/issues/2812
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>

I applied this patch (2/2) to the pin control tree for fixes.

Yours,
Linus Walleij
