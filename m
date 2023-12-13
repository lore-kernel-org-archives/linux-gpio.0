Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ag6I/XTd"
Received: from mail-oo1-xc30.google.com (mail-oo1-xc30.google.com [IPv6:2607:f8b0:4864:20::c30])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3EEDC10B
	for <linux-gpio@vger.kernel.org>; Wed, 13 Dec 2023 09:31:02 -0800 (PST)
Received: by mail-oo1-xc30.google.com with SMTP id 006d021491bc7-5906eac104bso4222678eaf.2
        for <linux-gpio@vger.kernel.org>; Wed, 13 Dec 2023 09:31:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702488661; x=1703093461; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=wjunn4+x2QEs4HRrQcozT7INn2DM0lGSHIZkmkDz3T0=;
        b=Ag6I/XTdLuJGSEy9JYSkVfLEMPbwUs64OaN4Dacp7wHVZ0Nh+1YskYD9dsz+sFfx9J
         ucgNxfKFhSJD/uJ761qondE7IrYQk7AKSKoXeGDzpdh2EBru7syJJrmHOHZjidqp5Lkx
         GrfCGflh4cDwv3poBpJ0cS9KwHwxmyi4malb6l1ho9SyhXF3UAIZWwfPSEuCZ5OSO9cF
         Zn+e1s5zG5rp1UdO1IoL1V6WB6nQYlX7I/c0VChgsENgrXMqQmBot4gIPL0ed3CkoR9S
         VN4XUD2MJ+cIZSy/pnJDOzCpCFek92FmgtXwqEU5Jda7y0OqcDp7YD8FMbVTn1oL/qC6
         4Kng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702488661; x=1703093461;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wjunn4+x2QEs4HRrQcozT7INn2DM0lGSHIZkmkDz3T0=;
        b=Lh1Fl6ev4g3S/Wtay3Mq4t1bCTmIbh2UYvc73Oz+YYL/N6afYZxgzArgMgRqCUZGtk
         elMc57wapEHo5nLORIxptxnR0gbw/vv7QwVQvZuwCno2q+tGjeXPMi3YX1kkFpkxmZDg
         zx238yj2gj2+X8IvDY4hUVgly2Ry6LmxcgH/r3PavJ7wKNfTBtKjUelRBVKbTk8f2cd8
         0gpumdFAHJiNvN+qemKGvwUJvtGl4C4wfdCDfvzjYiuRv5RM+ut3CXDz2cBGIFuJ3s4R
         BFRTtn0DIhwRkJWnU+vN5zVQm/Zhaa/h7mAtXH3CVXNqQIIvvvEP00QG4Yp4vlLqb/9n
         +djQ==
X-Gm-Message-State: AOJu0YyWFVWEiEchKW1Hd3lHnG5X0WxcAZFDpwbkXVQJo6HKyIpH6YdG
	WeH7nttbLAvxcYRrVSNwXUYahi6hqOHzpsVwZ6DjTGbKSlg=
X-Google-Smtp-Source: AGHT+IGJOC51zTOdRtxrs1wZD50r+92zdZ0GIFctEbde2I92NEOh30rcjQWNHbqWtzuEzjNq9/aeje5YbOhxYnnIS3s=
X-Received: by 2002:a05:6820:162c:b0:590:6fd1:4b54 with SMTP id
 bb44-20020a056820162c00b005906fd14b54mr6046960oob.3.1702488661262; Wed, 13
 Dec 2023 09:31:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Hank Barta <hbarta@gmail.com>
Date: Wed, 13 Dec 2023 11:30:50 -0600
Message-ID: <CABTDG8_e23N_ANpF29Ho5gOo4HwnJvXdk9gLp-94HUAJaFFJSg@mail.gmail.com>
Subject: unsubscribe
To: linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

unsubscribe
