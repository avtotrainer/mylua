# Git: ახალი განშტოების შექმნა და push

## 1. ძირითადი რეპოზიტორის შემოწმება

1. **Git კონფიგურაციის ნახვა**
   თქვენს რეპოზიტორში შეამოწმეთ, რომელია ძირითადი (default) რეპოზიტორი:

   ```sh
   git remote -v
   ```

   ეს ბრძანება დაგანახებთ დისტანციური რეპოზიტორების სიას და მათ URL-ებს.
   ჩვეულებრივ, ძირითადი რეპოზიტორის სახელი იქნება `origin`.

2. **ძირითადი განშტოების ნახვა**
   იმის გასაგებად, თუ რომელია თქვენი ძირითადი განშტოება (branch),
   გამოიყენეთ შემდეგი ბრძანება:

   ```sh
   git branch -r
   ```

   ეს ბრძანება დაგანახებთ დისტანციურ განშტოებებს. ჩვეულებრივ, ძირითადი
   განშტოება იქნება `main` ან `master`.

## 2. ახალი განშტოების შექმნა და გადართვა

1. **ლოკალური რეპოზიტორის განახლება**
   განაახლეთ თქვენი ლოკალური რეპოზიტორი ძირითადი განშტოებიდან:

   ```sh
   git pull origin main
   ```

   ან თუ თქვენი ძირითადი განშტოება არის `master`, მაშინ:

   ```sh
   git pull origin master
   ```

2. **ახალი განშტოების შექმნა და გადართვა**
   ახალი განშტოების შესაქმნელად და მასზე გადართვისთვის გამოიყენეთ შემდეგი
   ბრძანება:

   ```sh
   git checkout -b ახალი_განშტოება
   ```

   `ახალი_განშტოება` არის ახალი განშტოების სახელი, რომელიც თქვენ გსურთ.

## 3. ცვლილებების დამატება და commit-ი

1. **ცვლილებების დამატება**
   სამუშაო დირექტორიაში არსებული ცვლილებების დამატება:

   ```sh
   git add .
   ```

2. **ცვლილებების commit-ი**
   ცვლილებების commit-ი შესაბამისი მესიჯით:

   ```sh
   git commit -m "თქვენი commit მესიჯი"
   ```

## 4. ახალი განშტოების push დისტანციურ რეპოზიტორზე

1. **ახალი განშტოების push და upstream branch-ის შექმნა**
   ახალი განშტოების push და მისი დაკავშირება დისტანციურ რეპოზიტორზე:

   ```sh
   git push --set-upstream origin ახალი_განშტოება
   ```

   ან უფრო მოკლე ვარიანტად:

   ```sh
   git push -u origin ახალი_განშტოება
   ```

## სრული ინსტრუქცია

## ნაბიჯები ახალი განშტოების შესაქმნელად და push-თვის

1. **ძირითადი რეპოზიტორის და ძირითადი განშტოების ნახვა**

   ```sh
   git remote -v
   git branch -r
   ```

2. **ლოკალური რეპოზიტორის განახლება**

   ```sh
   git pull origin main
   ```

   ან

   ```sh
   git pull origin master
   ```

3. **ახალი განშტოების შექმნა და მასზე გადართვა**

   ```sh
   git checkout -b ახალი_განშტოება
   ```

4. **ცვლილებების დამატება**

   ```sh
   git add .
   ```

5. **ცვლილებების commit-ი**

   ```sh
   git commit -m "თქვენი commit მესიჯი"
   ```

6. **ახალი განშტოების push და მისი დაკავშირება დისტანციურ რეპოზიტორზე**

   ```sh
   git push --set-upstream origin ახალი_განშტოება
   ```

   ან

   ```sh
   git push -u origin ახალი_განშტოება
   ```

### რეზიუმე

1. შეამოწმეთ, რომელია თქვენი ძირითადი რეპოზიტორი და ძირითადი
   განშტოება (`git remote -v` და `git branch -r`).
2. განაახლეთ თქვენი ლოკალური რეპოზიტორი
   (`git pull origin main` ან `git pull origin master`).
3. შექმენით და გადაერთეთ ახალ განშტოებაზე (`git checkout -b ახალი_განშტოება`).
4. დაამატეთ ცვლილებები (`git add .`).
5. შექმენით commit-ი (`git commit -m "თქვენი commit მესიჯი"`).
6. push-ი და upstream branch-ის შექმნა
   (`git push --set-upstream origin ახალი_განშტოება`
   ან `git push -u origin ახალი_განშტოება`).

ამ ინსტრუქციით თქვენ შეძლებთ შექმნათ ახალი განშტოება და გააკეთოთ მისი push
დისტანციურ რეპოზიტორზე.

Git-ში განშტოების (branch) გამოცვლა (switch) მარტივი პროცესია. ამისათვის
შეგიძლიათ გამოიყენოთ `git checkout` ან ახალი ბრძანება `git switch`, რომელიც
სპეციალურად განკუთვნილია განშტოების გამოცვლისთვის.

### 1. არსებული განშტოების ნახვა

ლოკალურ რეპოზიტორში არსებული განშტოების სანახავად გამოიყენეთ შემდეგი ბრძანება:

```sh
git branch
```

### 2. ახალი განშტოების შექმნა და მასზე გადართვა

ახალი განშტოების შესაქმნელად და მასზე გადართვისთვის:

```sh
git checkout -b ახალი_განშტოება
```

ან `git switch` ბრძანების გამოყენებით:

```sh
git switch -c ახალი_განშტოება
```

### 3. არსებულ განშტოებაზე გადართვა

არსებულ განშტოებაზე გადართვისთვის:

```sh
git checkout არსებული_განშტოება
```

ან `git switch` ბრძანების გამოყენებით:

```sh
git switch არსებული_განშტოება
```

### სრული მაგალითი

#### 1. არსებული განშტოების ნახვა

```sh
git branch
```

#### 2. ახალი განშტოების შექმნა და მასზე გადართვა

```sh
git checkout -b ახალი_განშტოება
```

ან

```sh
git switch -c ახალი_განშტოება
```

#### 3. არსებული განშტოების გადართვა

```sh
git checkout არსებული_განშტოება
```

ან

```sh
git switch არსებული_განშტოება
```

### რეზიუმე:

1. **ახალი განშტოების შექმნა და მასზე გადართვა**:

   ```sh
   git checkout -b ახალი_განშტოება
   ```

   ან

   ```sh
   git switch -c ახალი_განშტოება
   ```

2. **არსებულ განშტოებაზე გადართვა**:
   ```sh
   git checkout არსებული_განშტოება
   ```
   ან
   ```sh
   git switch არსებული_განშტოება
   ```

ეს ინსტრუქციები დაგეხმარებათ განშტოების (branch) შექმნაში, მასზე გადართვასა და არსებულ განშტოებაზე გადართვაში.
