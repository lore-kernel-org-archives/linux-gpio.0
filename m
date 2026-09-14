Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D8E6448CEC
	for <linux-gpio@vger.kernel.org>; Mon, 14 Sep 2026 12:39:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789389590; cv=none; b=QfiaInIULm437RrxbnkRrThCCHnCA9uMJ2dr88u4QR4HEueShhuYRlZnTqzt4M022bUGywDMWll+/Z6UL04RBbTWQFUhU8GSJzruCwwblOupTRqFhrc5DUJGEnRNeF//mBJ8Mgh+HHgL7OJtofIkNMDanz5Cb/comyUZHlm2YQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789389590; c=relaxed/simple;
	bh=O/gngp4hf+LLp5p9T8vhJw8mUWabD83UKmDRD05jdnY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pAZ+TcWS9tLrVBpNOZHa9DFx6KoDbxy+ToTnwCVKqMv9RoGNMibcbpWpV2QXoUSSfqUdJrBEJ1g3K+uqBWZp3Nu56+xMW+aQghbokxlr5tAdRMJk9kEc4euk4FRsAWHt709b2FVuB0iYd0GSj7tEKJ0ll1KP979jUz8pkQsAins=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Mm0R0eCr; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mm0R0eCr"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49d097b4939so8813755e9.0
        for <linux-gpio@vger.kernel.org>; Mon, 14 Sep 2026 05:39:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789389586; x=1789994386; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O/gngp4hf+LLp5p9T8vhJw8mUWabD83UKmDRD05jdnY=;
        b=Mm0R0eCrqc7dKBJXEc2108LWQqYgHpDh2NeGwHjyMgkW54IsZ06E6yNGBfXYXAhyVV
         HcCpkcfmGLZNmtzcmnS/4kaX0MTP1rA0ZugIlLG+G2wAH3Jm/+KVxfrLIlzpvqSAs9AH
         1IXOj9Gfq0kJfT9y+m2ioAbKnSgin096v5Oxoha8y5URiemnRYXp0xmU1iQZhpVNJ1QG
         UPWfPU0Rr7uWnYBhymIOS4Uos8DXtWNZn0jVR2exlqYqiV8BwT4u5Dff8B48VEOXHhSA
         inYRKxJiFtC70nNf+nnwYAI6rojrYEc2boOB77bLQqYzG1IOaDHqOwFCwoXq431Zyc/K
         2Zuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789389586; x=1789994386;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=O/gngp4hf+LLp5p9T8vhJw8mUWabD83UKmDRD05jdnY=;
        b=qQTeFtFfqjCgGQi7oCfeuOfoKIpH1ho0C9CiKdOAORMKJRIBwZH/INY8zcAB2QtGSM
         Wr+pWVZXFlboHVBr3RsYESJU6M7Uj3Iy4KNy685mRw6BWkCM8dJsPUJjTXj7uAYYo/wE
         llZVAdxxCVXaK1JlqjEqbwEQau8EJ9XZa5gZA3x7wTRoNYPGguGE8vzpO/knUBLsE4ZI
         EbREGiOf8s5LdwOW8lCzvBpFtyMshbMCn5I2alhrI51NUe4419uYGZt2ghk/aKz3VID7
         7Tbhn4gc/whakv5dnDzpXt9P1/tvrvzK7oAUqjOi+qWtvlWbuZvY8D6LFPB0PatqgncH
         Ul7w==
X-Forwarded-Encrypted: i=1; AKwUvBxdbSmaeFRTllk+r++x/U5Pwk0neIU2DVvoISVH2JWNEqx9GpOIfRBKnu+/sGTmyn5YdujE/J84myDP@vger.kernel.org
X-Gm-Message-State: AFuF++maUMdyXj3u78WNNlodyTgOvdBN1ArVDDIg9aC2jiDQ57w71OnL
	G9fTqYLxGvFTIvhOLiOE7NqaqivFmlspsXuMgsW04OnCyJJgxVXUKvui
X-Gm-Gg: AYBFou3Uuph3vszJVxZlYdTLnb2lazISgrZ/Y+WehUbjQxGo+AIXi1d3xF8fJLiMfcC
	8QeuSCEPcNEjdiOzVjbOdWKhO0PgvCHw+NXwPZXbtDzKdEuJQV0A0PgbYv99rdvjj/xh+fmlyTX
	zcyHrlCMZBgSwVo43bHTizqXSdS0RNP+qYRrcme/wkkdFeqTd+BwwrbyhAiFDMfw0rm13mVhON8
	c6hcHnHP/g/BBuMRfvKpPBlbNmwdVxKh7eVfcaaoDYAqIATnFuGPXtp0PAKOHWpgzKBNvms49qF
	cX84BMykt01J1CUHyHs3AJ9urAdwLpKbklrGKemcwGnzd4VZwe1wqok5pK3sUIGWBwd2fO8d5Pa
	TgRjRFLc/bnOjBJUWN3hR9TYqxuMJGkkkFvw+gRnAjTX5z0OoENRn63I7Q6NNi579l07YePvg51
	mOvO1ZsjhBvSWtejRxvbckTW92HSZcmYWS2mvPYOJ2cnIhFuUirR0JReddS2OdN3XCaVV/XbKiG
	f+m
X-Received: by 2002:a05:600c:4f41:b0:49d:38:afce with SMTP id 5b1f17b1804b1-49e7a6868c0mr31405635e9.22.1789389586006;
        Mon, 14 Sep 2026 05:39:46 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb34f353sm26035194f8f.26.2026.09.14.05.39.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 05:39:45 -0700 (PDT)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: Dong Aisheng <aisheng.dong@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Jacky Bai <ping.bai@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	imx@lists.linux.dev,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Mehmet Fide <mehmet.fide@screeningeagle.com>
Subject: Re: [PATCH v5 1/3] pinctrl: imx: answer OUTPUT_ENABLE/INPUT_ENABLE queries from the pad register
Date: Mon, 14 Sep 2026 14:39:44 +0200
Message-ID: <20260914123944.149806-1-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <CAD++jLnmgKrmUnyCx8dq9yFuJxx68Tt-3XPz0WRzOO8F7805OA@mail.gmail.com>
References: 
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Linus,

On 2026-09-14 Linus Walleij wrote:
> This looks like something I could apply separately from the rest,
> can I just queue this patch in the pinctrl tree?

Thanks for the reviews. If it is all the same to you, I would keep the
three together until v6 has been looked at; gpio-mmio depends on this
patch to get correct answers on Vybrid, so I would rather not have it
land ahead of the rest. v6 goes out this week with Haibo's comments
addressed and a small pinctrl patch for the CONFIG_PINCTRL=n stubs
added. Once that is settled, this patch can go through your tree and the
gpio patches through Bartosz's in the same cycle.

Best regards,
Mehmet
