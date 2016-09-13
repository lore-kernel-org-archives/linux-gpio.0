From: Colin Ian King <colin.king@canonical.com>
Subject: Re: [PATCH] gpio: pca953x: initialize ret to zero to avoid returning
 garbage
Date: Tue, 13 Sep 2016 13:45:29 +0100
Message-ID: <5e5928e0-7a7a-915e-1090-726cc502f3ce@canonical.com>
References: <20160909083154.26442-1-colin.king@canonical.com>
 <CACRpkdYHRjUoANEibzexrmGQiVHL4cgYWZPr6H-_GA1HqqpTNw@mail.gmail.com>
 <944b682f-6217-f759-7429-339274cd5894@electromag.com.au>
 <18457294.js4cyg49EU@wuerfel>
 <CACRpkdZOd2qeCCvC3f0n4SZtmt9PQMOyOGuyS7Oio6qLRc+0vQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACRpkdZOd2qeCCvC3f0n4SZtmt9PQMOyOGuyS7Oio6qLRc+0vQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Arnd Bergmann <arnd@arndb.de>
Cc: Phil Reid <preid@electromag.com.au>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On 13/09/16 13:46, Linus Walleij wrote:
> On Tue, Sep 13, 2016 at 2:31 PM, Arnd Bergmann <arnd@arndb.de> wrote:
> 
>> Please try to avoid adding initializations in the local variable
>> declaration, they just hide otherwise useful warnings when
>> you get a function that actually does something incorrect
>> in some code paths.
> 
> Agreed, sorry for my ignorance :(
> 
> I duly corrected the git and reverted the other patch instead of yours.
> 
> Yours,
> Linus Walleij
> 
Makes sense. Thanks Linus
