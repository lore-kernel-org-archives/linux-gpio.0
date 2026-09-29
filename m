Received: from zg8tmtyylji0my4xnjqumte4.icoremail.net (zg8tmtyylji0my4xnjqumte4.icoremail.net [162.243.164.118])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70DE43A8753;
	Tue, 29 Sep 2026 09:36:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.243.164.118
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790674611; cv=none; b=BPEYLIPSVaepy4ZNNPVKs3sVqJ6IIGxsFKz5+YzQtlIlHXyuVMlxWobMekI6YK0EhlAfwdijhAgIX2FaMKN9rdqt7g3NozjLFw/b6R5U9q6taSLHYuQSjA7oXikRTSvqOw9uCiBrYKtR8Hq+KJkqpe4xgHyvu3B4BbLwpB4ZacI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790674611; c=relaxed/simple;
	bh=h91sJdvhM7q216OZHwfDSWOw4W5YEZquMkBzf6TLKqI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aLU6tYiuCxKf0g3lQYBACntiK48TRstvDPvFbguHH7FJdALp2/XLbm2vlzrhzCvxX1shHfn8dRFLTMMJsaR8LXheAy/aNkbft6JP48kIa4BdIIFmwp9n5i2ggX37kaFe9FzijTfhKWPgiRFjJqQrDPrDuMgozmPIqhG+dxPGFdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=zju.edu.cn; spf=pass smtp.mailfrom=zju.edu.cn; arc=none smtp.client-ip=162.243.164.118
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=zju.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zju.edu.cn
Received: from zju.edu.cn (unknown [10.98.66.117])
	by mtasvr (Coremail) with SMTP id _____wCXQz2hhrtq7ztGAQ--.39143S3;
	Tue, 29 Sep 2026 17:36:34 +0800 (CST)
Received: from localhost.localdomain (unknown [10.98.66.117])
	by mail-app2 (Coremail) with UTF8SMTPA id zC_KCgCX7nyhhrtq2QsWAA--.19477S2;
	Tue, 29 Sep 2026 17:36:33 +0800 (CST)
From: Fan Wu <fanwu01@zju.edu.cn>
To: brgl@kernel.org
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	songl@zju.edu.cn,
	linusw@kernel.org,
	Fan Wu <fanwu01@zju.edu.cn>
Subject: Re: [PATCH v2] gpio: mpsse: fix race when arming the IRQ poll worker
Date: Tue, 29 Sep 2026 09:35:36 +0000
Message-Id: <20260929093536.18396-1-fanwu01@zju.edu.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <CAMRc=Mf0+O7393fxkcupH2Gs3q9L4-hZn=ORE_zC_c9FFM67KQ@mail.gmail.com>
References: <20260928112546.631440-1-fanwu01@zju.edu.cn> <CAMRc=Mf0+O7393fxkcupH2Gs3q9L4-hZn=ORE_zC_c9FFM67KQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:zC_KCgCX7nyhhrtq2QsWAA--.19477S2
X-CM-SenderInfo: qrstjiaswqq6lmxovvfxof0/
X-CM-DELIVERINFO: =?B?YPRd7gXKKxbFmtjJiESix3B1w3vZ3A9ovKVTomAyoQazvoRs/NHSP8GI2EvgeEEW7R
	sfnVvLbuoOKy0xUR2OEh/Lyhlr+l17lfOb9luG9nUURQsfQnozS4PQS7OmbKlSFdaBJfy9
	PIj7FnqIhDcjlHOtZvGp9E6mavGmQbzmcFsnzP86
X-Coremail-Antispam: 1Uk129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7
	ZEXasCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29K
	BjDU0xBIdaVrnRJUUU9Gb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26c
	xKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vE
	j48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7CjxV
	AFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x02
	67AKxVW0oVCq3wAac4AC62xK8xCEY4vEwIxC4wAS0I0E0xvYzxvE52x082IY62kv0487Mc
	804VCY07AIYIkI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY
	67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y4
	8IcxkI7VAKI48JM4x0Y48IcxkI7VAKI48G6xCjnVAKz4kxMxAIw28IcxkI7VAKI48JMxC2
	0s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI
	0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE
	14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20x
	vaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8
	JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU8Tv3UUUUUU==

On Mon, 28 Sep 2026 12:22:28 +0000, Bartosz Golaszewski <brgl@kernel.org> said:
> Please always include the changelog between iterations of the same series. I
> have no idea what changed since v1.

Sorry about that. v3 (fresh thread) spells out the changes since v1 in
the changelog below the ---.

When comparing with the posted v2: v3 expands the comment above the
deferred free and rewords the commit message; there is no functional
change since v2.

Thanks,
Fan Wu

