Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IZde46Vm"
Received: from mail-yw1-x112d.google.com (mail-yw1-x112d.google.com [IPv6:2607:f8b0:4864:20::112d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94F4E10E0
	for <linux-gpio@vger.kernel.org>; Wed, 29 Nov 2023 07:08:53 -0800 (PST)
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-5cbcfdeaff3so70645047b3.0
        for <linux-gpio@vger.kernel.org>; Wed, 29 Nov 2023 07:08:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701270532; x=1701875332; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zXic/+6itk3TGberNCqdj0WRwhs080Vma5guEUi6jGo=;
        b=IZde46VmHNIIbuY24qvFOn6esBY00ngqFYFsgR5gyuXiSn+C7CdX3JnHzPrGYiKKy7
         kP91XdBiN0VomlmBvuH7KV9uTSN4ccA6P6m5rLkzqqZE9tbh/B3CcZV8wBZjHXuko/Ug
         a5Apw8ej9NkUx4opLrBqwKbbjo8BjIEmCCxbVDJ8np1Hzoe3OVPhZ53Tzhu7M7Ylvdpq
         5jqTd7+NUjTU2CmTPcQkgFxUPr7dq/JuaJIBlueDsjSf1YRsjfNKG5M2DTSJzxOd3NDm
         prwzGCSfuPDq417l/mkD563bVamc/yb5UgaixLOtiAg4H38anUPSta64Uh/e2cQ3NROC
         nUEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701270532; x=1701875332;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zXic/+6itk3TGberNCqdj0WRwhs080Vma5guEUi6jGo=;
        b=X73yxOzdcy07+tWZjLm1KcZa9gssjgCQ2wHPFwjeJQeq0hbvuWMzwf7gsASyswXhdn
         pBQwxuU6ScDi38X0hkyRnDn32PedWSyrXC6/0hwSkibCUuisEiruuORqq93X7O52E9AE
         05phEPvgFGYlQ1EjR6mEwyqRvEfMp7g/ZL18454fALKn3z97NVtgJ5MFsZSsXnHHw2Jo
         XTbJZ/HEZEpBKUozKyio0ZqHWc6JIByV0nIJlF4tHg8xHwSzPPxqNUrXrXrwhlyRkP+t
         0avyKNIhlo7HY1Om2U0LBnxXmZhdtBW6WuVngiezQwqbZ0CWit0Oc+JSdyaiyqoaalp5
         W1QA==
X-Gm-Message-State: AOJu0YwyhOZc0FJtb0EMW/+HeZjn2+Nqu5eeAVNHHdAu6DmRcIL1scED
	LrArei2on0NKkmRfjiPek4jkG6t1egi49jn3ESn6Fg==
X-Google-Smtp-Source: AGHT+IH7uajT5yd4kNXCf/d1PhdaI1T+d+TSGNjzi5KTm1ObFm3BiIfA7yF+l/iNCuCXiIGfOOeUrxX1jG13TlH8GPI=
X-Received: by 2002:a81:5c05:0:b0:5ce:4dfb:bce8 with SMTP id
 q5-20020a815c05000000b005ce4dfbbce8mr20114025ywb.7.1701270532587; Wed, 29 Nov
 2023 07:08:52 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CACRpkdZtVNZFWSUgb4=gUE2mQRb=aT_3=zRv1U71Vsq0Mm34eg@mail.gmail.com>
 <CAHk-=whk4oNQazgpzkujc2=ntVQMhU5ko7Canp2Uuq6CpyGzmA@mail.gmail.com>
In-Reply-To: <CAHk-=whk4oNQazgpzkujc2=ntVQMhU5ko7Canp2Uuq6CpyGzmA@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 29 Nov 2023 16:08:40 +0100
Message-ID: <CACRpkdZRf7bNVmJCgsVD0uheD1VLkLKG13d1oS-kbT8BFyRKQw@mail.gmail.com>
Subject: Re: [GIT PULL] Pin control fixes for v6.7
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, 
	Maria Yu <quic_aiquny@quicinc.com>, Charles Keepax <ckeepax@opensource.cirrus.com>, 
	Chester Lin <clin@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 29, 2023 at 3:56=E2=80=AFPM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
> On Wed, 29 Nov 2023 at 04:09, Linus Walleij <linus.walleij@linaro.org> wr=
ote:
> >
> > The most interesting patch is the list iterator fix in the core by Mari=
a
> > Yu, it took a while for me to realize what was going on there.
>
> That commit message still doesn't explain what the problem was.
>
> Why is p->state volatile there? It seems to be a serious locking bug
> if p->state can randomly change there, and the READ_ONCE() looks like
> a "this hides the problem" rather than an actual real fix.

Thanks for looking into it Linus, Maria can you look closer at this and
try to pinpoint exactly what happens?

Is the bug never manifesting with GCC for example?

In the meantime I'll cook a fixes branch without this one commit.

Yours,
Linus Walleij
