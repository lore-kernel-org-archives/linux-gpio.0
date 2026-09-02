Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F3FB35B125
	for <linux-gpio@vger.kernel.org>; Wed,  2 Sep 2026 02:12:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788315124; cv=pass; b=nYJoUFBn5OM6QhLFT7/NpdF3Vc82+VyDaBebaz/yN5odWyicWqLH4wKzKdPS2wuHt+pO6ktfeSceq05emLpDcCR7f08iYEXAuRmaNobN6I/96XV0U5+gcDTWNuj74QP0kOXdFtA4TCKBqjU6gebel40bWbe+B7Xuw4FlVJIuO/g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788315124; c=relaxed/simple;
	bh=m8dMhdjgbxNUNzyBg0Mvg7t7wUGshuRTgqDq2yP8CA8=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=df538B3mCDTd2vXKzFV3FTdOeTfyDl6A/jnAAZk5kDjlvmjM48g4ovKTd3E4rLlTa4CqNF36KG+x20PmhHsBM5N2vyFg2i/RjWPPZ0tfElJz9+HEjjNbqeZ5tGa3uwTxXl6oT9qbNd/D8Yl7RhXPfb4Eq1crW6W8BR94rLBjC0k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IEeJ/F/v; arc=pass smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IEeJ/F/v"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6a18e24ad25so737229a12.1
        for <linux-gpio@vger.kernel.org>; Tue, 01 Sep 2026 19:11:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788315117; cv=none;
        d=google.com; s=arc-20260327;
        b=F+wSfs0E1Vcie+p9qjwjLi+UZ4NZHIrcIbMcUXdAaCwsM7LBeetvRyBXWb41uSjObz
         iMnfkFoP6i3If61UTX1v2bz4rZDJMlJgwTu+Owqby+/WG6O6k1mxJY46I0HQgY0F59Pp
         MC1cPhkdoAWRJmi0rJZjwz4fxJwvRefPLNS1AK2g0X9D+rDYNNjW89hJroQZdzyN7CEL
         gtjISbZfOg6QjtWg7i7QJiBiqyRocN1akkOvXBluB2lDeabScORZJrIN96WZ6+7+6Udc
         ItCzNANUzoq6dF/KE5JcwJB9fkOCLrcO8wnGpV4r24LUvzH8leamZtt4Yuo34IKLN0KX
         SY9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=eDcze+EPoOau0aTnfHPEFG0SVyi8+C2I2+TXMMX9vLY=;
        fh=Q34pavfa725khEGWNXM9ZvKJwefSeZgq989CDAY7iRk=;
        b=WR6BuYXqzaCpFftgxUGItMxB+tujTfo3MWcM15hGIKiFrv9b+aMTCNsyelh9rqnWqR
         lTlivLO1LGwAOWKGTmD4hh/shAa5FlrmrghvkKIFirOxIvNVLKSTq2WJVxiNQxFBPjba
         BEl0VgBIgjbY9lBo99Hapmo3NUYWFFuOTf/3YIRJULVAdQRoRi7zRVjEdwbiVU93fqVq
         SQAEKF6b58FkttcaoPNw61pI/+VPC8LAhNVZ0XOoZoCm1fPhcglIOyD9nQ1kjgUIoJXE
         fgRA9pFkgDWvhogcNzOMzfh9cYzYOrnHggCooLwfdSDfp9w2Pg22V6WvKO0yPAY+6myr
         qt4Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788315117; x=1788919917; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eDcze+EPoOau0aTnfHPEFG0SVyi8+C2I2+TXMMX9vLY=;
        b=IEeJ/F/vF5GMCyCTxHIzZbmt3tHnTeJE8jPTJ4seKUkuAlc4tv9wHr/U5Hkxijv2TM
         xO6dVs0273lmffBHsesd0ieeXU4NXRnO3Y5HT60pJwxxIbmzNNYRSfk04cCKrdWylinj
         QDKe3qaMlV5oV4LSb7Y0y+ZDmc7qKeVubeDYgjPkEQTCmK1wYxWyLDlRflK9hkOzTLlA
         TOqL4NvrHGmlhFWY0Vknv/75DvQDQE0M8aFPVSNMJ4sNmI1IdM4NFkyJhmKExmuwfnVW
         SlqeQ8h6DT9HS0jHuD5AQ1Ha1gSX7or/sp+BdeCisBtVJzc6mZ/u+G2ekMHoXO/iUNWN
         FQyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788315117; x=1788919917;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=eDcze+EPoOau0aTnfHPEFG0SVyi8+C2I2+TXMMX9vLY=;
        b=S8F1TDiz0PiVzYotMqP02XgT2duUXH7qjR2+XvY6/hJjmVqyUlMmGggOT1O+QXonV3
         UkUIvVZQ0ghGBHXn4ECSKev9D5gMPKCjfLNBC464Zjfpdv6bqJP3IaiEUj4BGyNuXOdQ
         fm9qqhr90fIzhFlKxUnlchj6CJyagJgsxg8zgD54XTwXU5fb+2KL+v5vweglIplAlJ2U
         mBJ4HjcjklzxegLeL4Cr7B2LmftHnLYCGOuv0toVklUrNYUh+QsVG5TZxQIrytDKsECO
         Z9z5w77+7nyhW1EGlWFtoCVknCIVlvD8O0Tgz47Za4b7zfsJOwQ5TjniWVrbAwm4ZxdO
         k1JQ==
X-Gm-Message-State: AFuF++ns99ZjT1hpgWDjs/5VEWNsY17XeGOyoSIiZj/bnbT1FbfWAZLr
	QOIAhnux5V9NuccM4Dm4JbW/aMOHpKKxlOikhrwmDtdToS/fwcqx6WCzTcWFH5FTTTZXbaj65hd
	ELo2gDOT4AhnGk2uxxFXcvhcMu3KLNpPyx7WKYCHz1yVw/uhedg==
X-Gm-Gg: AYBFou3nyqTtSwxpf2OegZpogctMiz6VoX+vEW0saqQ+M0GnILARYszWzrPEbJWifW+
	YzWyQq9kqsw2s2d1IDUllZgGucAh0RietfDokG1UvlQkmpRV2bapLTbWOgdWAGE4htUtyEvCw2E
	OI42FiZzqqpkLrEglNP69u1otpYVgg1MQwrHfL21ozmVC8qcWSOpzBubxzETubJGGB1WmvPp6B8
	fBZ+oOE0geKg0pb5fl7cmWL7K5/hpN7Ifoup3v3DeVlhCcBWf3ta4PWLck7G18PDxrKvXUCwzae
	KLDurqSML6cfizxcOd6LEq6b1cx42VfnOqWTN0hwmUQ=
X-Received: by 2002:a05:6402:4284:b0:6a6:32f5:ff40 with SMTP id
 4fb4d7f45d1cf-6a682af8134mr1043284a12.20.1788315116598; Tue, 01 Sep 2026
 19:11:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Qingyu Zhang <usupergate@gmail.com>
Date: Wed, 2 Sep 2026 10:11:44 +0800
X-Gm-Features: AcwNN1WS-AgXw-xjU-Unr85m45__hVj5DZxPESU09yVatno4Yzj-jTHKyb7kYhs
Message-ID: <CAPBHdam702gA05btopOc=0mDpmzR5g4fkxOwXbxXkW6CPRaqmw@mail.gmail.com>
Subject: [BUG] gpio: sloppy-logic-analyzer: trigger buffer leak and capture
 OOB race
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello,

gpio-sloppy-logic-analyzer's debugfs "trigger" file has two defects in
trigger_write(): it leaks the previous trigger buffer on every overwrite,
and it races with fops_capture_set() so a shorter rewrite can cause a
slab out-of-bounds read. One patch fixes both.

Type: memory leak + out-of-bounds read (same function, same lock)

* Summary (leak)

trigger_write() does:

       buf = memdup_user(ubuf, count);
       priv->trig_data = buf;   /* previous buffer leaked */
       priv->trig_len = count;

There is no kfree of the old trig_data. capture later kfree's it only
if capture actually runs.

* Summary (OOB race)

Capture waits for trigger pairs with IRQs off:

       for (i = 0; i < priv->trig_len; i += 2) {
               do {
                       ...
               } while ((state & priv->trig_data[i]) != priv->trig_data[i + 1]);
       }

trigger_write() assigns a new trig_data / trig_len with no lock.
A 2048-byte trigger (1023 instant-match pairs + one never-match)
then a 2-byte rewrite while capture sits at i=2046 reads past the
new 2-byte object.

blob_lock is already held for the whole capture, including that wait.
trigger_write() just never takes it.

* Affected

Introduced in 7828b7bbbf20. Still present after 44f3468a0aef (unbind
UAF) and 7a7baebd9f23 (probe leak). Reproduced on 08dbfad3f504.
Needs CONFIG_GPIO_SLOPPY_LOGIC_ANALYZER, CONFIG_DEBUG_FS, kmemleak
(leak) and KASAN (OOB). No real analyzer hardware: a dummy gpiochip
binder is enough (see poc/).

* Reproduction (leak)

1. insmod gpio-sloppy-logic-analyzer.ko and a dummy gpiochip binder.
2. echo clear > /sys/kernel/debug/kmemleak
3. Write to debugfs trigger twice without starting capture:

       printf 'AB' > $DIR/trigger
       printf 'CD' > $DIR/trigger

4. echo scan > /sys/kernel/debug/kmemleak

kmemleak shows unreferenced objects from memdup_user in trigger_write.

* Reproduction (OOB)

       dd if=/dev/zero bs=2046 count=1 of=/tmp/trig
       printf '\x01\x01' >> /tmp/trig
       cat /tmp/trig > $DIR/trigger
       echo 1 > $DIR/capture &
       sleep 1
       printf '\x01\x01' > $DIR/trigger

KASAN: slab-out-of-bounds in fops_capture_set.

PoC: poc/run.sh (both halves). poc/bind.c provides the dummy gpiochip.

* Expected

trigger_write() frees the old buffer and takes blob_lock around the
swap, same as capture.

* Actual

Leaked trig_data buffers; KASAN slab-out-of-bounds on concurrent
shorter trigger write.

Please apply the suggested patch.

Thanks.

Suggested patch:
```
diff --git a/drivers/gpio/gpio-sloppy-logic-analyzer.c
b/drivers/gpio/gpio-sloppy-logic-analyzer.c
index 044d81e7cafb..a0fa0755368a 100644
--- a/drivers/gpio/gpio-sloppy-logic-analyzer.c
+++ b/drivers/gpio/gpio-sloppy-logic-analyzer.c
@@ -213,8 +213,11 @@ static ssize_t trigger_write(struct file *file,
const char __user *ubuf,
    if (IS_ERR(buf))
        return PTR_ERR(buf);

+    mutex_lock(&priv->blob_lock);
+    kfree(priv->trig_data);
    priv->trig_data = buf;
    priv->trig_len = count;
+    mutex_unlock(&priv->blob_lock);

    return count;
}
```
